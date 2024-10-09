import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/api/network/api_client.dart';
import 'package:puntos_smart_user/app/core/common/end_points.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/send_code_request_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/send_number_request_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/send_code_response_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/send_number_response_model.dart';
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

  Future<SendNumberResponseModel> sendNumber(
      {required SendNumberRequestModel model}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.sendNumber,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        return SendNumberResponseModel.fromJson(response.data);
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
        debugPrint('Error durante el envio de telefono: $e');
        throw Exception('Error inesperado durante el envio de telefono');
      }
    }
  }

  Future<SendCodeResponseModel> sendCode(
      {required SendCodeRequestModel model}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.sendCodeVerify,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        return SendCodeResponseModel.fromJson(response.data);
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
        debugPrint('Error durante el envio de codigo de verificacion: $e');
        throw Exception(
            'Error inesperado durante el envio de codigo de verificacion');
      }
    }
  }

  Future<Map<String, dynamic>> sigUp({required SignUpModel model}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.register,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        final token = response.data['access_token'];
        final status = response.data['status'];
        final message = response.data['message'];
        return {'access_token': token, 'status': status, 'message': message};
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
        debugPrint('Error durante el registro: $e');
        throw Exception('Error inesperado durante el registro');
      }
    }
  }
}
