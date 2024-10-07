import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:puntos_smart_user/app/core/bloc/location/location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationState.initial()) {
    on<GetCurrentLocation>(_onGetCurrentLocation);
    on<SearchLocationByText>(_onSearchLocationByText);
    on<SelectLocationOnMap>(_onSelectLocationOnMap);
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
        ),
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final address = placemarks.isNotEmpty
          ? "${placemarks.first.street}, ${placemarks.first.locality}"
          : "Unknown location";

      emit(state.copyWith(
        status: LocationStatus.success,
        currentPosition: position,
        address: address,
        selectedLatitude: position.latitude,
        selectedLongitude: position.longitude,
      ));
    } catch (e) {
      emit(state.copyWith(status: LocationStatus.error));
    }
  }

  Future<void> _onSearchLocationByText(
      SearchLocationByText event, Emitter<LocationState> emit) async {
    emit(state.copyWith(status: LocationStatus.loading));

    try {
      // Busca las ubicaciones a partir del texto ingresado
      List<Location> locations = await locationFromAddress(event.query);

      if (locations.isNotEmpty) {
        List<String> results = [];

        for (var location in locations) {
          // Obtenemos el nombre de la calle y demás información a partir de las coordenadas
          List<Placemark> placemarks = await placemarkFromCoordinates(
            location.latitude,
            location.longitude,
          );

          if (placemarks.isNotEmpty) {
            final placemark = placemarks.first;
            final address =
                "${placemark.street}, ${placemark.locality}, ${placemark.country}";

            // Agrega el resultado a la lista de sugerencias
            results.add(address);
            emit(state.copyWith(
              status: LocationStatus.success,
              searchResults: results,
              address: address,
            ));
          }
        }

        // Emitimos el estado con las sugerencias legibles para el usuario
      } else {
        emit(state.copyWith(status: LocationStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(status: LocationStatus.error));
    }
  }

  Future<void> _onSelectLocationOnMap(
      SelectLocationOnMap event, Emitter<LocationState> emit) async {
    emit(state.copyWith(
      status: LocationStatus.success,
      selectedLatitude: event.latitude,
      selectedLongitude: event.longitude,
    ));
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false; // Si el usuario sigue negando los permisos
      }
    }

    return true; // Permisos concedidos
  }
}
