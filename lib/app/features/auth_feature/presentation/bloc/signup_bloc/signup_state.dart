part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final SignUpStatus signUpStatus;
  final String userName;
  final String mail;
  final String password;
  final String confirmPassword;
  final String referenceCode;
  final bool termnsAndConditions;
  //
  final String? userNameError;
  final String? mailError;
  final String? passwordError;
  final String? confirmPasswordError;

  const SignupState({
    required this.signUpStatus,
    required this.userName,
    required this.mail,
    required this.password,
    required this.confirmPassword,
    required this.referenceCode,
    required this.termnsAndConditions,
    this.userNameError,
    this.mailError,
    this.passwordError,
    this.confirmPasswordError,
  });

  SignupState copyWith({
    SignUpStatus? signUpStatus,
    String? userName,
    String? mail,
    String? password,
    String? confirmPassword,
    String? referenceCode,
    bool? termnsAndConditions,
    //
    String? userNameError,
    String? mailError,
    String? passwordError,
    String? confirmPasswordError,
  }) =>
      SignupState(
        signUpStatus: signUpStatus ?? this.signUpStatus,
        userName: userName ?? this.userName,
        mail: mail ?? this.mail,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        termnsAndConditions: termnsAndConditions ?? this.termnsAndConditions,
        referenceCode: referenceCode ?? this.referenceCode,
        userNameError: userNameError ?? this.userNameError,
        mailError: mailError ?? this.mailError,
        passwordError: passwordError ?? this.passwordError,
        confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      );

  factory SignupState.initial() {
    return const SignupState(
      signUpStatus: SignUpStatus.initial,
      userName: '',
      mail: '',
      password: '',
      confirmPassword: '',
      termnsAndConditions: false,
      referenceCode: '',
      userNameError: null,
      mailError: null,
      passwordError: null,
      confirmPasswordError: null,
    );
  }
  @override
  List<Object> get props => [
        signUpStatus,
        userName,
        mail,
        password,
        confirmPassword,
        referenceCode,
        termnsAndConditions,
        userNameError ?? '',
        mailError ?? '',
        passwordError ?? '',
        confirmPasswordError ?? '',
      ];
}

enum SignUpStatus {
  initial, // Estado inicial antes de cualquier acción
  loading, // Estado mientras se está procesando el inicio de sesión
  success, // Estado cuando el registro fue exitoso
  network, // Problemas de conexión
  server, // Error en el servidor

  //
  passwordNotEqual,
  termsNotAccepted, // No se aceptaron los términos y condiciones
  //
  emailAlreadyInUse, // El correo ya está registrado
  invalidEmail, //Email invalido
  weakPassword, // La contraseña es débil
  userExist, //usuario o alias existe
  userRegister, //usuario ya registrado
  unknown, // Error desconocido
}
