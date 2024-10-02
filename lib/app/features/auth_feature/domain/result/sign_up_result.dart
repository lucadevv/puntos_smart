abstract class SignUpResult {}

class SignUpSuccess extends SignUpResult {
  final String accessToken;
  final String message;

  SignUpSuccess({required this.accessToken, required this.message});
}

class SignUpFealure extends SignUpResult {
  final SignUpFealure signUpFealure;

  SignUpFealure({required this.signUpFealure});
}

enum SignUpFealureStatus {
  network,
  notFound,
  server,
  unAuthorized,
  unknow,
}
