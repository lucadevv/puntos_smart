import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module/survey_response_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/repository/module_repository.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/category_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/flash_promotions_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/geo_promotions_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/survey_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_bloc.dart';

import '../../../domain/entities/response/module/category_response_entity.dart';
import '../../../domain/entities/response/module/flash_promotions_response_entity.dart';
import '../../../domain/entities/response/module/geo_promotions_response_entity.dart';

part 'module_event.dart';
part 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  final ModuleRepository _moduleRepository;
  final LocationBloc _locationBloc;

  ModuleBloc({
    required ModuleRepository homeRepository,
    required LocationBloc locationBloc,
  })  : _moduleRepository = homeRepository,
        _locationBloc = locationBloc,
        super(ModuleState.initial()) {
    on<GetAllGeoPromotions>(_getAllGeoPromotions);
    on<GetCategoriesPromotions>(_getCategoriesPromotions);
    on<GetAllFlasPromotions>(_getAllFlasPromotions);
    on<GetAllSurvers>(_getAllSurvers);
  }

  Future<void> _getAllGeoPromotions(
      GetAllGeoPromotions event, Emitter<ModuleState> emit) async {
    emit(state.copyWith(geoPromotionsStatus: GeoPromotionsStatus.loading));

    try {
      final latLngModel = _locationBloc.state.locationModel;
      final response = await _moduleRepository.getAllGeoPromotions(
          latLng: latLngModel.latLng ?? const LatLng(-11.995777, -77.063773));
      if (response is GeoPromotionsSuccess) {
        emit(state.copyWith(
          listGeoPromotiosns: response.listGeoPromotiosns,
          geoPromotionsStatus: GeoPromotionsStatus.success,
        ));
      } else if (response is GeoPromotionsFailure) {
        emit(state.copyWith(geoPromotionsStatus: GeoPromotionsStatus.notFound));
      }
    } catch (e) {
      emit(state.copyWith(geoPromotionsStatus: GeoPromotionsStatus.server));
    }
  }

  Future<void> _getCategoriesPromotions(
      GetCategoriesPromotions event, Emitter<ModuleState> emit) async {
    emit(state.copyWith(categoriesStatus: CategoriesStatus.loading));
    try {
      final response =
          await _moduleRepository.getAllCategories(idModule: event.idModule);
      if (response is CategorySuccess) {
        await Future.delayed(const Duration(seconds: 5));
        emit(state.copyWith(
          listCategories: response.listCategories,
          categoriesStatus: CategoriesStatus.success,
        ));
      } else if (response is CategoryFailure) {
        emit(state.copyWith(categoriesStatus: CategoriesStatus.notFound));
      }
    } catch (e) {
      emit(state.copyWith(categoriesStatus: CategoriesStatus.server));
    }
  }

  Future<void> _getAllFlasPromotions(
      GetAllFlasPromotions event, Emitter<ModuleState> emit) async {
    emit(state.copyWith(flashPromotionsStatus: FlashPromotionsStatus.loading));

    try {
      final latLngModel = _locationBloc.state.locationModel;
      final response = await _moduleRepository.getAllFlashPromotions(
          latLng: latLngModel.latLng ?? const LatLng(-11.995777, -77.063773));
      if (response is FlashPromotionsSuccess) {
        await Future.delayed(const Duration(seconds: 5));
        emit(state.copyWith(
          listFlashPromotions: response.listFlashPromotions,
          flashPromotionsStatus: FlashPromotionsStatus.success,
        ));
      } else if (response is FlashPromotionsFailure) {
        emit(state.copyWith(
            flashPromotionsStatus: FlashPromotionsStatus.notFound));
      }
    } catch (e) {
      emit(state.copyWith(flashPromotionsStatus: FlashPromotionsStatus.server));
    }
  }

  Future<void> _getAllSurvers(
      GetAllSurvers event, Emitter<ModuleState> emit) async {
    emit(state.copyWith(surveysStatus: SurveysStatus.loading));

    try {
      final latLngModel = _locationBloc.state.locationModel;
      final response = await _moduleRepository.getAllSurveys(
          latLng: latLngModel.latLng ?? const LatLng(-11.995777, -77.063773));
      if (response is SurveySuccess) {
        await Future.delayed(const Duration(seconds: 5));
        emit(state.copyWith(
          listSurvey: response.listSurvey,
          surveysStatus: SurveysStatus.success,
        ));
      } else if (response is FlashPromotionsFailure) {
        emit(state.copyWith(surveysStatus: SurveysStatus.notFound));
      }
    } catch (e) {
      emit(state.copyWith(surveysStatus: SurveysStatus.server));
    }
  }
}
