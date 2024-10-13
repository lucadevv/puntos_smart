import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/sing_up_response_entity.dart';

abstract class SignUpResult {}

class SignUpSuccess extends SignUpResult {
  final SignUpResponseEntity signUpResponseEntity;

  SignUpSuccess({required this.signUpResponseEntity});
}

class SignUpFailure extends SignUpResult {
  final SignUpFailureStatus signUpFailureStatus;

  SignUpFailure({required this.signUpFailureStatus});
}

enum SignUpFailureStatus {
  network, // Problemas de conexión
  server, // Error en el servidor
  emailAlreadyInUse, // El correo ya está registrado
  invalidEmail, //Email invalido
  invalidData, // Datos proporcionados no válidos
  weakPassword, // La contraseña es débil
  userExist, //usuario o alias existe
  userRegister, //usuario ya registrado
  termsNotAccepted, // No se aceptaron los términos y condiciones
  unknown, // Error desconocido
}
