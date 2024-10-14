part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final SignInStatus signInStatus;
  final String phone;
  final String password;
  final String? errorPhone;
  final bool rememberCheck;
  const SignInState({
    required this.signInStatus,
    required this.phone,
    required this.password,
    required this.rememberCheck,
    this.errorPhone,
  });

  factory SignInState.initial() {
    return const SignInState(
      signInStatus: SignInStatus.initial,
      phone: '',
      password: '',
      rememberCheck: false,
      errorPhone: null,
    );
  }
  SignInState copyWith({
    SignInStatus? signInStatus,
    String? token,
    String? message,
    String? phone,
    String? password,
    bool? rememberCheck,
    String? errorPhone,
  }) =>
      SignInState(
        signInStatus: signInStatus ?? this.signInStatus,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        rememberCheck: rememberCheck ?? this.rememberCheck,
        errorPhone: errorPhone ?? this.errorPhone,
      );

  @override
  List<Object> get props =>
      [signInStatus, phone, password, rememberCheck, errorPhone ?? ""];
}

enum SignInStatus {
  initial, // Estado inicial antes de cualquier acción
  loading, // Estado mientras se está procesando el inicio de sesión
  success, // Estado cuando el inicio de sesión fue exitoso
  notFound,
  server,
  failure, // , notFoundEstado cuando ocurrió un error
  invalidCredentials, // Estado cuando las credenciales son incorrectas
  networkError, // Estado cuando hay un problema de red
  unknown,
}
