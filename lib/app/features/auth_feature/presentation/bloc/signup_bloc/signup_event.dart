part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpResquest extends SignupEvent {
  final SignUpEntity signUpEntity;

  const SignUpResquest({required this.signUpEntity});
  @override
  List<Object> get props => [signUpEntity];
}

class NameChangedSignUp extends SignupEvent {
  final String name;

  const NameChangedSignUp({required this.name});
  @override
  List<Object> get props => [name];
}

class LastNameChangedSignUp extends SignupEvent {
  final String lastName;

  const LastNameChangedSignUp({required this.lastName});
  @override
  List<Object> get props => [lastName];
}

class MailChangedSignUp extends SignupEvent {
  final String mail;

  const MailChangedSignUp({required this.mail});
  @override
  List<Object> get props => [mail];
}

class PasswordChangedSignUp extends SignupEvent {
  final String password;

  const PasswordChangedSignUp({required this.password});
  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChangedSignUp extends SignupEvent {
  final String confirmPassword;

  const ConfirmPasswordChangedSignUp({required this.confirmPassword});
  @override
  List<Object> get props => [confirmPassword];
}

class NumberPhoneChangedSignUp extends SignupEvent {
  final int numberPhone;

  const NumberPhoneChangedSignUp({required this.numberPhone});
  @override
  List<Object> get props => [numberPhone];
}

class TermsCondsChangedSignUp extends SignupEvent {
  final bool terms;

  const TermsCondsChangedSignUp({required this.terms});
  @override
  List<Object> get props => [terms];
}
