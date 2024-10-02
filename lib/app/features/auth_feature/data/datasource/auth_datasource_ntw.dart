import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/api/network/api_client.dart';
import 'package:puntos_smart_user/app/core/common/end_points.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/sig_up_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/sing_in_mode.dart';

class AuthDatasourceNtw {
  final ApiClient _apiClient;

  AuthDatasourceNtw({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;
  Future<Map<String, dynamic>> sigIn({required SignInModel model}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.login,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        final token = response.data['access_token'];
        final status = response.data['status'];
        return {'access_token': token, 'status': status};
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
        debugPrint('Error durante el inicio de sesión: $e');
        throw Exception('Error inesperado durante el inicio de sesión');
      }
    }
  }

  Future<void> sigUp({required SignUpModel model}) async {
    try {
      // Convertir el modelo SignUpModel a un mapa (JSON) para la solicitud
      final response = await _apiClient.postData(
        EndPoints.register,
        data: model.toJson(),
      );
      // Manejar la respuesta según sea necesario
      debugPrint('Signup successful: ${response.data}');
    } catch (e) {
      // Manejo de errores
      debugPrint('Error during signup: $e');
      throw Exception('Failed to sign up');
    }
  }
}
