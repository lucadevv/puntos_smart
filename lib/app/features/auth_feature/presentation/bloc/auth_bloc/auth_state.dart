part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStateStatus authStateStatus;
  const AuthState({required this.authStateStatus});

  AuthState copyWith({
    AuthStateStatus? authStateStatus,
  }) =>
      AuthState(
        authStateStatus: authStateStatus ?? this.authStateStatus,
      );

  factory AuthState.initial() => const AuthState(
        authStateStatus: AuthStateStatus.authInitial,
      );

  @override
  List<Object> get props => [authStateStatus];
}

enum AuthStateStatus {
  authInitial,
  authAuthenticated,
  authUnauthenticated,
}
