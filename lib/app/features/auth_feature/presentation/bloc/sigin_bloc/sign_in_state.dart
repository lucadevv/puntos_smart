part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final SignInStatus signInStatus;

  final String token;
  final String message;
  final String user;
  final String password;
  final bool rememberCheck;
  const SignInState({
    required this.token,
    required this.message,
    required this.signInStatus,
    required this.user,
    required this.password,
    required this.rememberCheck,
  });

  factory SignInState.initial() {
    return const SignInState(
      token: '',
      signInStatus: SignInStatus.initial,
      message: '',
      user: '',
      password: '',
      rememberCheck: false,
    );
  }
  SignInState copyWith({
    SignInStatus? signInStatus,
    String? token,
    String? message,
    String? user,
    String? password,
    bool? rememberCheck,
  }) =>
      SignInState(
        token: token ?? this.token,
        message: message ?? this.message,
        signInStatus: signInStatus ?? this.signInStatus,
        user: user ?? this.user,
        password: password ?? this.password,
        rememberCheck: rememberCheck ?? this.rememberCheck,
      );

  @override
  List<Object> get props =>
      [signInStatus, token, message, user, password, rememberCheck];
}

enum SignInStatus {
  initial, // Estado inicial antes de cualquier acción
  loading, // Estado mientras se está procesando el inicio de sesión
  success, // Estado cuando el inicio de sesión fue exitoso
  failure, // Estado cuando ocurrió un error
  invalidCredentials, // Estado cuando las credenciales son incorrectas
  networkError // Estado cuando hay un problema de red
}
