import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/api/failure/app_failure_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/verify_codeotp_result.dart';

class ErrorSendCodeHundler {
  static VerifyCodeOtpFailureStatus handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    if (statusCode == 400) {
      final errorMessage = error.response?.data['status']?.toString() ?? '';
      return _handleBadRequest(errorMessage);
    } else if (statusCode == 500) {
      return VerifyCodeOtpFailureStatus.server;
    }
    if (statusCode == 502) {
      return VerifyCodeOtpFailureStatus.server;
    } else if (error.type == DioExceptionType.connectionError) {
      return VerifyCodeOtpFailureStatus.network;
    } else {
      return VerifyCodeOtpFailureStatus.unknown;
    }
  }

  static VerifyCodeOtpFailureStatus _handleBadRequest(String message) {
    if (message.contains(AppFailureText.unverifiedCode)) {
      return VerifyCodeOtpFailureStatus.invalidCode;
    } else if (message.contains(AppFailureText.expiredCode)) {
      return VerifyCodeOtpFailureStatus.expiredCode;
    } else if (message.contains(AppFailureText.alredyVerified)) {
      return VerifyCodeOtpFailureStatus.alredyVerified;
    } else {
      return VerifyCodeOtpFailureStatus.unknown;
    }
  }
}
