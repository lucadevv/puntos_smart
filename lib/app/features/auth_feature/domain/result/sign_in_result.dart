abstract class SignInResult {}

class SignInSuccess extends SignInResult {
  final String accessToken;
  final String status;

  SignInSuccess({required this.accessToken, required this.status});
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
