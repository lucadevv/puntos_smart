part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpResquest extends SignupEvent {
  const SignUpResquest();
  @override
  List<Object> get props => [];
}

class UserNameChangedSignUp extends SignupEvent {
  final String userName;

  const UserNameChangedSignUp({required this.userName});
  @override
  List<Object> get props => [userName];
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

class ReferCodeChangedSignUp extends SignupEvent {
  final String? referenceCode;

  const ReferCodeChangedSignUp(this.referenceCode);
  @override
  List<Object> get props => [referenceCode ?? ''];
}

class TermsCondsChangedSignUp extends SignupEvent {
  final bool terms;

  const TermsCondsChangedSignUp({required this.terms});
  @override
  List<Object> get props => [terms];
}
