import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/signin_response_entity.dart';

abstract class SignInResult {}

class SignInSuccess extends SignInResult {
  final SignInResponseEntity signInResponseEntity;

  SignInSuccess({required this.signInResponseEntity});
}

class SignInFailure extends SignInResult {
  final SignInFailureStatus signInFailureStatus;

  SignInFailure({
    required this.signInFailureStatus,
  });
}

enum SignInFailureStatus {
  network, // Error de red
  notFound, // Error 404 o similar
  server, // Error de servidor (500)

  unAuthorized, // Credenciales incorrectas o no autorizado
  unknown // Error desconocido
}
