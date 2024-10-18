import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:puntos_smart_user/app/api/network/api_client.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/model/response/module/category_response_model.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/model/response/module/flash_promotions_response_model.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/model/response/module/surver_response_model.dart';

import '../../../../../../../core/constants/end_points.dart';
import '../model/response/module/geo_promotions_response_model.dart';

class ModuleDatasourceNtw {
  final ApiClient _apiClient;
  ModuleDatasourceNtw({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;
  Future<List<GeoPromotionsResponseDbModel>> getAllGeoPromotions(
      {required LatLng latLng}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.geoPromotions,
        data: {"latitud": "-11.995777", "longitud": "-77.063773"},
      );
      if (response.statusCode == 200) {
        final list = response.data as List<dynamic>;
        final result = list
            .map((item) => GeoPromotionsResponseDbModel.fromJson(item))
            .toList();
        return result;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      if (e is DioException) {
        rethrow;
      } else {
        debugPrint('Error durante leer  promociones localizadas$e');
        throw Exception('Error durante leer  promociones localizadas');
      }
    }
  }

  Future<List<CategoryResponseModel>> getAllCategories(
      {required int idModule}) async {
    try {
      final response = await _apiClient.getData(
        "${EndPoints.categories}/$idModule",
      );
      if (response.statusCode == 200) {
        final list = response.data as List<dynamic>;
        return list
            .map((model) => CategoryResponseModel.fromJson(model))
            .toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      if (e is DioException) {
        rethrow;
      } else {
        debugPrint('Error durante leer  categorias$e');
        throw Exception('Error durante leer  categorias');
      }
    }
  }

  Future<List<FlasPromotionsResponseModel>> getAllFlashPromotions(
      {required LatLng latLng}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.geoPromotions,
        data: {"latitud": "-11.995777", "longitud": "-77.063773"},
      );
      if (response.statusCode == 200) {
        final list = response.data as List<dynamic>;
        final result = list
            .map((item) => FlasPromotionsResponseModel.fromJson(item))
            .toList();
        return result;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      if (e is DioException) {
        rethrow;
      } else {
        debugPrint('Error durante leer  promociones flash$e');
        throw Exception('Error durante leer  promociones flash');
      }
    }
  }

  Future<List<SurveryResponseModel>> getAllSurvers(
      {required LatLng latLng}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.surveys,
        data: {"latitud": "-11.995777", "longitud": "-77.063773"},
      );
      if (response.statusCode == 200) {
        final list = response.data as List<dynamic>;
        final result =
            list.map((item) => SurveryResponseModel.fromJson(item)).toList();
        return result;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      if (e is DioException) {
        rethrow;
      } else {
        debugPrint('Error durante leer  encuestas $e');
        throw Exception('Error durante leer  encuestas');
      }
    }
  }
}
