import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/api/failure/app_failure_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/send_code_result.dart';

class ErrorSendCodeHundler {
  static SendCodeFailureStatus handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    if (statusCode == 400) {
      final errorMessage = error.response?.data['message']?.toString() ?? '';
      return _handleBadRequest(errorMessage);
    } else if (statusCode == 500) {
      return SendCodeFailureStatus.server;
    }
    if (statusCode == 502) {
      return SendCodeFailureStatus.server;
    } else if (error.type == DioExceptionType.connectionError) {
      return SendCodeFailureStatus.network;
    } else {
      return SendCodeFailureStatus.unknown;
    }
  }

  static SendCodeFailureStatus _handleBadRequest(String message) {
    if (message.contains(AppFailureText.unverifiedCode)) {
      return SendCodeFailureStatus.invalidCode;
    } else {
      return SendCodeFailureStatus.unknown;
    }
  }
}
