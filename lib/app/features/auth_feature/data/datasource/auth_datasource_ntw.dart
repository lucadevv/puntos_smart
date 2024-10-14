import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/api/network/api_client.dart';
import 'package:puntos_smart_user/app/core/constants/end_points.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/send_code_request_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/send_number_request_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/update_password_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/forgot_verify_number_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/signin_response_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/singup_response_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/update_password_response_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/verify_codeotp_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/verify_number_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/sig_up_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/sing_in_mode.dart';

class AuthDatasourceNtw {
  final ApiClient _apiClient;

  AuthDatasourceNtw({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;
  Future<SignInResponseModel> sigIn({required SignInModel model}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.login,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        return SignInResponseModel.fromJson(response.data);
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

  Future<VerifyNumberModel> verifyNumber(
      {required SendNumberRequestModel model}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.verifyNumber,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        return VerifyNumberModel.fromJson(response.data);
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

  Future<VerifyCodeOtpModel> verifyCode({
    required SendCodeRequestModel model,
    required String otpScreen,
  }) async {
    try {
      final endoPont = otpScreen == NameRoutes.registerScreen
          ? EndPoints.sendCodeVerify
          : EndPoints.forgotSendCodeVerify;
      final response = await _apiClient.postData(
        endoPont,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        return VerifyCodeOtpModel.fromJson(response.data);
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

  Future<SignUpResponseModel> sigUp({required SignUpModel model}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.register,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        return SignUpResponseModel.fromJson(response.data);
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

  Future<ForgoutVerifyNumberModel> forgotVerifyNumber(
      {required SendNumberRequestModel model}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.forgotVerifyNumber,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        return ForgoutVerifyNumberModel.fromJson(response.data);
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
        debugPrint(
            'Error durante el envio de telefono para recuperar contraseña: $e');
        throw Exception(
            'Error durante el envio de telefono para recuperar contraseña');
      }
    }
  }

  Future<UpdatePasswordResponseModel> updatePassword(
      {required UpdatePasswordModel model}) async {
    try {
      final response = await _apiClient.postData(
        EndPoints.updatePassword,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        return UpdatePasswordResponseModel.fromJson(response.data);
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
