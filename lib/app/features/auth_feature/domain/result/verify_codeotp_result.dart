import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/verify_codeotp_entity.dart';

abstract class VerifyCodeOtpResult {}

class VerifyCodeOtpSucces extends VerifyCodeOtpResult {
  final VerifyCodeOtpEntity verifyCodeOtpEntity;

  VerifyCodeOtpSucces({required this.verifyCodeOtpEntity});
}

class VerifyCodeOtpFailure extends VerifyCodeOtpResult {
  final VerifyCodeOtpFailureStatus verifyCodeOtpFailureStatus;

  VerifyCodeOtpFailure({required this.verifyCodeOtpFailureStatus});
}

enum VerifyCodeOtpFailureStatus {
  network, // Error de red
  server, // Error de servidor (500)
  invalidCode, //codigo invalido
  expiredCode,
  alredyVerified,
  unknown // Error desconocido
}
