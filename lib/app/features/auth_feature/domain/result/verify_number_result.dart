import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/verify_number_entity.dart';

abstract class VerifyNumberResult {}

class VerifyNumberSuccess extends VerifyNumberResult {
  final VerifyNumberEntity verifyNumberEntity;

  VerifyNumberSuccess({required this.verifyNumberEntity});
}

class VerifyNumberFailure extends VerifyNumberResult {
  final SendNumberFailureStatus sendNumberFailureStatus;
  VerifyNumberFailure({required this.sendNumberFailureStatus});
}

enum SendNumberFailureStatus {
  network, // Error de red
  notFound, // Error 404 o similar
  server, // Error de servidor (500)
  verifyNumber, // Numero ya existe
  invalidNumber, //numero invalido
  waitingVerification, //El número encuentra se encuentra en proceso de verificación.
  unknown // Error desconocido
}
