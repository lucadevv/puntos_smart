import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:puntos_smart_user/app/features/personal_information_feature/domain/entities/place_autocomplete_entity.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/domain/repository/location_repository.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/domain/results/location_detail_result.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/domain/results/place_autocomplete_result.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/presentation/bloc/location/location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository _locationRepository;
  LocationBloc({required LocationRepository locationRepository})
      : _locationRepository = locationRepository,
        super(LocationState.initial()) {
    on<GetCurrentLocation>(_onGetCurrentLocation);
    on<SearchLocationByText>(_onSearchLocationByText);
    on<SelectLocationOnMap>(_onSelectLocationOnMap);
    on<SelectedLocationEvent>(_selectedLocationEvent);
  }

  Future<void> _onGetCurrentLocation(
      GetCurrentLocation event, Emitter<LocationState> emit) async {
    emit(state.copyWith(status: LocationStatus.loading));
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) {
      emit(state.copyWith(
        status: LocationStatus.error,
      ));
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ));

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final address = placemarks.isNotEmpty
          ? "${placemarks.first.street}, ${placemarks.first.locality},${placemarks.first.postalCode}, ${placemarks.first.country}"
          : "Unknown location";
      final model = PlaceAutocompleteEntity(
          description: address,
          placeId: "",
          latLng: LatLng(position.latitude, position.longitude));
      emit(state.copyWith(
        status: LocationStatus.success,
        locationModel: model,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LocationStatus.error,
      ));
    }
  }

  Future<void> _onSearchLocationByText(
      SearchLocationByText event, Emitter<LocationState> emit) async {
    emit(state.copyWith(locationSearchStatus: LocationSearchStatus.loading));
    try {
      final response =
          await _locationRepository.getAllPlaceAutoComplete(input: event.query);
      if (response is PlaceAutocompleteSuccess) {
        emit(state.copyWith(
          placeAutoCompleteList: response.listPlaceAutocomplete,
          locationSearchStatus: LocationSearchStatus.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(locationSearchStatus: LocationSearchStatus.error));
    }
  }

  Future<void> _selectedLocationEvent(
      SelectedLocationEvent event, Emitter<LocationState> emit) async {
    try {
      final response =
          await _locationRepository.getLocationDetail(placeId: event.placeId);
      if (response is LocationDetailSuccess) {
        emit(state.copyWith(
          status: LocationStatus.success,
          locationModel: response.placeAutocompleteEntity,
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _onSelectLocationOnMap(
      SelectLocationOnMap event, Emitter<LocationState> emit) async {
    emit(state.copyWith(locationOnMapStatus: LocationOnMapStatus.loading));
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      emit(state.copyWith(
        status: LocationStatus.error,
      ));
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ));

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final address = placemarks.isNotEmpty
          ? "${placemarks.first.street}, ${placemarks.first.locality},${placemarks.first.postalCode}, ${placemarks.first.country}"
          : "Unknown location";
      final model = PlaceAutocompleteEntity(
          description: address,
          placeId: "",
          latLng: LatLng(position.latitude, position.longitude));
      emit(state.copyWith(
        locationOnMapStatus: LocationOnMapStatus.success,
        locationModel: model,
      ));
    } catch (e) {
      emit(state.copyWith(locationOnMapStatus: LocationOnMapStatus.error));
    }
  }

  Future<bool> _handleLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied ||
        status.isPermanentlyDenied ||
        status.isRestricted) {
      if (status.isPermanentlyDenied) {
        await openAppSettings();
        return false; // No puedes continuar sin permisos
      } else {
        status = await Permission.locationWhenInUse.request();
        return status.isGranted;
      }
    }
    return false;
  }
}
