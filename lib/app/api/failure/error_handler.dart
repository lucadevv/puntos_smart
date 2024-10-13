import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/api/failure/app_failure_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_up_result.dart';

class ErrorHandler {
  static SignUpFailureStatus handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;

    if (statusCode == 400) {
      final errorMessage = error.response?.data['message']?.toString() ?? '';
      return _handleBadRequest(errorMessage);
    } else if (statusCode == 404) {
      return SignUpFailureStatus.userRegister;
    } else if (statusCode == 422) {
      final errorMessage = error.response?.data['error']?.toString() ?? '';
      return _handleBadRequest422(errorMessage);
    } else if (statusCode == 500) {
      return SignUpFailureStatus.server;
    } else if (error.type == DioExceptionType.connectionError) {
      return SignUpFailureStatus.network;
    } else {
      return SignUpFailureStatus.unknown;
    }
  }

  static SignUpFailureStatus _handleBadRequest(String message) {
    if (message.contains(AppFailureText.emailExist)) {
      return SignUpFailureStatus.invalidEmail;
    } else if (message.contains(AppFailureText.emailAlreadyInUse)) {
      return SignUpFailureStatus.emailAlreadyInUse;
    } else if (message.contains(AppFailureText.weakPassword)) {
      return SignUpFailureStatus.weakPassword;
    } else {
      return SignUpFailureStatus.invalidData;
    }
  }

  static SignUpFailureStatus _handleBadRequest422(String message) {
    if (message.contains(AppFailureText.userNameExist)) {
      return SignUpFailureStatus.userExist;
    } else if (message.contains(AppFailureText.emailExist)) {
      return SignUpFailureStatus.emailAlreadyInUse;
    } else {
      return SignUpFailureStatus.invalidData;
    }
  }
}
