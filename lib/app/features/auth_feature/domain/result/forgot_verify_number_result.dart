import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/forgot_verify_number_entity.dart';

abstract class ForgotVerifyNumberResult {}

class ForgotVerifyNumberSuccess extends ForgotVerifyNumberResult {
  final ForgotVerifyNumberEntity forgotVerifyNumberEntity;

  ForgotVerifyNumberSuccess({required this.forgotVerifyNumberEntity});
}

class ForgotVerifyNumberFailure extends ForgotVerifyNumberResult {
  final ForgotVerifyNumberFailureStatus forgotVerifyNumberFailureStatus;

  ForgotVerifyNumberFailure({required this.forgotVerifyNumberFailureStatus});
}

enum ForgotVerifyNumberFailureStatus {
  network, // Error de red
  notFound, // Error 404 o similar
  server, // Error de servidor (500)
  invalidNumber, //numero invalido
  waitingVerification, //El número encuentra se encuentra en proceso de verificación.
  userNotFout, //usuario no encontrado
  unknown // Error desconocido
}
