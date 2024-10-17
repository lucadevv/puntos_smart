part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInRequested extends SignInEvent {
  const SignInRequested();

  @override
  List<Object> get props => [];
}

class SignInPhoneNumberChanged extends SignInEvent {
  final String number;
  const SignInPhoneNumberChanged({required this.number});
  @override
  List<Object> get props => [number];
}

class SignInPasswordChanged extends SignInEvent {
  final String password;
  const SignInPasswordChanged({required this.password});
  @override
  List<Object> get props => [password];
}

class SignInTermsChanged extends SignInEvent {
  final bool rememberCheck;
  const SignInTermsChanged({required this.rememberCheck});
  @override
  List<Object> get props => [rememberCheck];
}

class SaveCredentials extends SignInEvent {}

class ClearCredentials extends SignInEvent {}

class LoadSavedCredentials extends SignInEvent {}

class ClearUserAndPassword extends SignInEvent {}
