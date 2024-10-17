import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/repository/home_repository.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/geo_promotions_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_bloc.dart';

import '../../../domain/entities/response/module/geo_promotions_response_entity.dart';

part 'module_event.dart';
part 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  final HomeRepository _homeRepository;
  final LocationBloc _locationBloc;

  ModuleBloc({
    required HomeRepository homeRepository,
    required LocationBloc locationBloc,
  })  : _homeRepository = homeRepository,
        _locationBloc = locationBloc,
        super(ModuleState.initial()) {
    on<GetAllGeoPromotions>(_getAllGeoPromotions);
  }

  Future<void> _getAllGeoPromotions(
      GetAllGeoPromotions event, Emitter<ModuleState> emit) async {
    emit(state.copyWith(geoPromotionsStatus: GeoPromotionsStatus.loading));
    try {
      final latLngModel = _locationBloc.state.locationModel;
      final response = await _homeRepository.getAllGeoPromotions(
          latLng: latLngModel.latLng ?? const LatLng(-11.995777, -77.063773));
      if (response is GeoPromotionsSuccess) {
        emit(state.copyWith(
          listGeoPromotiosns: response.listGeoPromotiosns,
          geoPromotionsStatus: GeoPromotionsStatus.success,
        ));
      }
    } catch (e) {}
  }
}
