import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/api/failure/app_failure_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/forgot_verify_number_result.dart';

class ErrorForgotNumberHundler {
  static ForgotVerifyNumberFailureStatus handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    if (statusCode == 400) {
      final errorMessage = error.response?.data['status']?.toString() ?? '';
      return _handleBadRequest(errorMessage);
    } else if (statusCode == 404) {
      return ForgotVerifyNumberFailureStatus.userNotFout;
    } else if (statusCode == 422) {
      return ForgotVerifyNumberFailureStatus.invalidNumber;
    } else if (statusCode == 500) {
      return ForgotVerifyNumberFailureStatus.server;
    } else if (error.type == DioExceptionType.connectionError) {
      return ForgotVerifyNumberFailureStatus.network;
    } else {
      return ForgotVerifyNumberFailureStatus.unknown;
    }
  }

  static ForgotVerifyNumberFailureStatus _handleBadRequest(String message) {
    if (message.contains(AppFailureText.waitingVerification)) {
      return ForgotVerifyNumberFailureStatus.waitingVerification;
    } else {
      return ForgotVerifyNumberFailureStatus.unknown;
    }
  }
}
