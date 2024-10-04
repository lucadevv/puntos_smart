part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final SignUpStatus signUpStatus;
  final String name;
  final String lastName;
  final String mail;
  final String password;
  final String confirmPassword;
  final int numberPhone;
  final bool termnsAndConditions;
  const SignupState({
    required this.signUpStatus,
    required this.name,
    required this.lastName,
    required this.mail,
    required this.password,
    required this.confirmPassword,
    required this.numberPhone,
    required this.termnsAndConditions,
  });

  SignupState copyWith({
    SignUpStatus? signUpStatus,
    String? name,
    String? lastName,
    String? mail,
    String? password,
    String? confirmPassword,
    int? numberPhone,
    bool? termnsAndConditions,
  }) =>
      SignupState(
        signUpStatus: signUpStatus ?? this.signUpStatus,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        mail: mail ?? this.mail,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        numberPhone: numberPhone ?? this.numberPhone,
        termnsAndConditions: termnsAndConditions ?? this.termnsAndConditions,
      );

  factory SignupState.initial() {
    return const SignupState(
      signUpStatus: SignUpStatus.initial,
      name: '',
      lastName: '',
      mail: '',
      password: '',
      confirmPassword: '',
      numberPhone: 0,
      termnsAndConditions: false,
    );
  }
  @override
  List<Object> get props => [
        signUpStatus,
        name,
        lastName,
        mail,
        password,
        confirmPassword,
        numberPhone,
        termnsAndConditions,
      ];
}

enum SignUpStatus {
  initial, // Estado inicial antes de cualquier acción
  loading, // Estado mientras se está procesando el inicio de sesión
  success, // Estado cuando el inicio de sesión fue exitoso
  failure, // Estado cuando ocurrió un error
  invalidCredentials, // Estado cuando las credenciales son incorrectas
  networkError // Estado cuando hay un problema de red
}
