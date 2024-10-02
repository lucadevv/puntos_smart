part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInRequested extends SignInEvent {
  final SignInEntity signInEntity;

  const SignInRequested({
    required this.signInEntity,
  });

  @override
  List<Object> get props => [signInEntity];
}

class SignInEmailChanged extends SignInEvent {
  final String user;
  const SignInEmailChanged({required this.user});
  @override
  List<Object> get props => [user];
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
