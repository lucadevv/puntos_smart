import 'package:dio/dio.dart';

import 'package:puntos_smart_user/app/features/auth_feature/domain/result/update_password_result.dart';

class ErrorUpdatePasswordHundler {
  static UpdatePasswordFailureStatus handleDioError(DioException error) {
    final statusCode = error.response?.statusCode;
    if (statusCode == 404) {
      return UpdatePasswordFailureStatus.userNotFound;
    } else if (statusCode == 422) {
      return UpdatePasswordFailureStatus.passwordNotEqual;
    } else if (statusCode == 500) {
      return UpdatePasswordFailureStatus.server;
    } else if (error.type == DioExceptionType.connectionError) {
      return UpdatePasswordFailureStatus.network;
    } else {
      return UpdatePasswordFailureStatus.unknown;
    }
  }

  // static UpdatePasswordFailureStatus _handleBadRequest(String message) {
  //   if (message.contains(AppFailureText.waitingVerification)) {
  //     return UpdatePasswordFailureStatus.;
  //   } else {
  //     return UpdatePasswordFailureStatus.unknown;
  //   }
  // }
}
