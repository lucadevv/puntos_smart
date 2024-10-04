import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/api/failure/app_failure_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_up_result.dart';

class ErrorHandler {
  static SignUpFailureStatus handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;

    if (statusCode == 400) {
      final errorMessage = error.response?.data['message']?.toString() ?? '';
      return _handleBadRequest(errorMessage);
    } else if (statusCode == 500) {
      return SignUpFailureStatus.server;
    } else if (error.type == DioExceptionType.connectionError) {
      return SignUpFailureStatus.network;
    } else {
      return SignUpFailureStatus.unknown;
    }
  }

  static SignUpFailureStatus _handleBadRequest(String message) {
    if (message.contains(AppFailureText.invalidEmail)) {
      return SignUpFailureStatus.invalidEmail;
    } else if (message.contains(AppFailureText.emailAlreadyInUse)) {
      return SignUpFailureStatus.emailAlreadyInUse;
    } else if (message.contains(AppFailureText.weakPassword)) {
      return SignUpFailureStatus.weakPassword;
    } else if (message.contains(AppFailureText.phoneNumberExist)) {
      return SignUpFailureStatus.phoneNumberExist;
    } else {
      return SignUpFailureStatus.invalidData;
    }
  }
}
