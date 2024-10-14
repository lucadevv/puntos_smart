import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/api/network/api_client.dart';
import 'package:puntos_smart_user/app/core/constants/end_points.dart';
import 'package:puntos_smart_user/app/features/home_feature/data/model/response/banner_response_db_model.dart';

class HomeDatasourceNtw {
  final ApiClient _apiClient;
  HomeDatasourceNtw({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<BannerResponseDbModel> getAllBanners() async {
    try {
      final response = await _apiClient.getData(
        EndPoints.banners,
      );

      if (response.statusCode == 200) {
        return BannerResponseDbModel.fromJson(response.data);
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
        debugPrint('Error durante la acctualizacion de contraseña: $e');
        throw Exception('Error durante la acctualizacion de contraseña');
      }
    }
  }
}
