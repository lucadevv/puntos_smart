import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/update_password_response_entity.dart';

abstract class UpdatePasswordResult {}

class UpdatePasswordSuccess extends UpdatePasswordResult {
  final UpdatePasswordResponseEntity updatePasswordResponseEntity;

  UpdatePasswordSuccess({required this.updatePasswordResponseEntity});
}

class UpdatePasswordFailure extends UpdatePasswordResult {
  final UpdatePasswordFailureStatus updatePasswordFailureStatus;

  UpdatePasswordFailure({required this.updatePasswordFailureStatus});
}

enum UpdatePasswordFailureStatus {
  network, // Problemas de conexión
  server, // Error en el servidor

  //
  userNotFound,
  passwordNotEqual,
  //
  weakPassword, // La contraseña es débil
  unknown, // Error desconocido
}
