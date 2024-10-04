abstract class SignUpResult {}

class SignUpSuccess extends SignUpResult {
  final String accessToken;
  final String message;
  final String status;

  SignUpSuccess({
    required this.accessToken,
    required this.message,
    required this.status,
  });
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
  phoneNumberExist, //Numero de telefono ya existe
  invalidData, // Datos proporcionados no válidos
  weakPassword, // La contraseña es débil
  termsNotAccepted, // No se aceptaron los términos y condiciones
  unknown, // Error desconocido
}
