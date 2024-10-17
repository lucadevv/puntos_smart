import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/api/network/api_client.dart';
import 'package:puntos_smart_user/app/core/constants/end_points.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/model/response/banner_response_db_model.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/model/response/featured_response_db_model.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/model/response/news_response_db_model.dart';

class HomeDatasourceNtw {
  final ApiClient _apiClient;
  HomeDatasourceNtw({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<BannerResponseDbModel> getAllBanners() async {
    try {
      final response = await _apiClient.getData(
        EndPoints.bannersNoLogin,
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
        debugPrint('Error durante leer los banners:$e');
        throw Exception('Error durante leer los banners');
      }
    }
  }

  Future<BannerResponseDbModel> getAllModulesNoLogin() async {
    try {
      final response = await _apiClient.getData(
        EndPoints.modulesNoLogin,
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
        debugPrint('Error durante leer los modulos: $e');
        throw Exception('Error durante leer los modulos');
      }
    }
  }

  Future<NewsResponseDbModel> getAllNews() async {
    try {
      final response = await _apiClient.getData(
        EndPoints.newsHome,
      );

      if (response.statusCode == 200) {
        return NewsResponseDbModel.fromJson(response.data);
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
        debugPrint('Error durante leer las noticias $e');
        throw Exception('Error durante leer las noticias');
      }
    }
  }

  Future<FutureResponsedDbModel> getAllFeatured() async {
    try {
      final response = await _apiClient.getData(
        EndPoints.featuredHome,
      );

      if (response.statusCode == 200) {
        return FutureResponsedDbModel.fromJson(response.data);
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
        debugPrint('Error durante leer  destacados $e');
        throw Exception('Error durante leer destacados');
      }
    }
  }
}
