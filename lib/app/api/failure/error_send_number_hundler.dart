import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/api/failure/app_failure_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/verify_number_result.dart';

class ErrorSendNumberHundler {
  static SendNumberFailureStatus handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    if (statusCode == 201) {
      return SendNumberFailureStatus.verifyNumber;
    } else if (statusCode == 400) {
      final errorMessage = error.response?.data['status']?.toString() ?? '';
      return _handleBadRequest(errorMessage);
    } else if (statusCode == 404) {
      return SendNumberFailureStatus.notFound;
    } else if (statusCode == 422) {
      return SendNumberFailureStatus.invalidNumber;
    } else if (statusCode == 500) {
      return SendNumberFailureStatus.server;
    } else if (statusCode == 502) {
      return SendNumberFailureStatus.server;
    } else if (error.type == DioExceptionType.connectionError) {
      return SendNumberFailureStatus.network;
    } else {
      return SendNumberFailureStatus.unknown;
    }
  }

  static SendNumberFailureStatus _handleBadRequest(String message) {
    if (message.contains(AppFailureText.waitingVerification)) {
      return SendNumberFailureStatus.waitingVerification;
    } else {
      return SendNumberFailureStatus.unknown;
    }
  }
}
