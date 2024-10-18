import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/datasource/module_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module/category_response_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module/geo_promotions_response_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module/survey_response_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/repository/module_repository.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/category_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/flash_promotions_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/geo_promotions_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/survey_result.dart';

import '../../domain/entities/response/module/flash_promotions_response_entity.dart';

class ModuleRepositoryImpl implements ModuleRepository {
  final ModuleDatasourceNtw _moduleDatasourceNtw;

  ModuleRepositoryImpl({required ModuleDatasourceNtw moduleDatasourceNtw})
      : _moduleDatasourceNtw = moduleDatasourceNtw;
  @override
  Future<GeoPromotionsResult> getAllGeoPromotions(
      {required LatLng latLng}) async {
    try {
      final response =
          await _moduleDatasourceNtw.getAllGeoPromotions(latLng: latLng);
      return GeoPromotionsSuccess(
          listGeoPromotiosns: GeoPromotionsResponseEntity.listModelToListEntity(
        listModel: response,
      ));
    } catch (e) {
      if (e is DioException) {
        return GeoPromotionsFailure(
            geoPromotionsFailureStatus: GeoPromotionsFailureStatus.notFound);
      } else {
        return GeoPromotionsFailure(
            geoPromotionsFailureStatus: GeoPromotionsFailureStatus.unknown);
      }
    }
  }

  @override
  Future<CategoryResult> getAllCategories({required int idModule}) async {
    try {
      final response =
          await _moduleDatasourceNtw.getAllCategories(idModule: idModule);

      return CategorySuccess(
          listCategories: CategoryResponseEntity.listModelToListEntity(
              listModel: response));
    } catch (e) {
      if (e is DioException) {
        return CategoryFailure(
            categoryFailureStatus: CategoryFailureStatus.notFound);
      } else {
        return CategoryFailure(
            categoryFailureStatus: CategoryFailureStatus.unknown);
      }
    }
  }

  @override
  Future<FlashPromotionsResult> getAllFlashPromotions(
      {required LatLng latLng}) async {
    try {
      final response =
          await _moduleDatasourceNtw.getAllFlashPromotions(latLng: latLng);
      return FlashPromotionsSuccess(
          listFlashPromotions:
              FlashPromotionsResponseEntity.listModelToListEntity(
        listModel: response,
      ));
    } catch (e) {
      if (e is DioException) {
        return FlashPromotionsFailure(
            flashPromotionsFailureStatus:
                FlashPromotionsFailureStatus.notFound);
      } else {
        return FlashPromotionsFailure(
            flashPromotionsFailureStatus: FlashPromotionsFailureStatus.unknown);
      }
    }
  }

  @override
  Future<SurveyResult> getAllSurveys({required LatLng latLng}) async {
    try {
      final response = await _moduleDatasourceNtw.getAllSurvers(latLng: latLng);
      return SurveySuccess(
          listSurvey: SurveryResponseEntity.listModelToListEntity(
        list: response,
      ));
    } catch (e) {
      if (e is DioException) {
        return SurveyFailure(failureStatus: SurveyFailureStatus.notFound);
      } else {
        return SurveyFailure(failureStatus: SurveyFailureStatus.unknown);
      }
    }
  }
}
