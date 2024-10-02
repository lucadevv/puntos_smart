import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puntos_smart_user/app/api/services_token/token_storage_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenStorageServices _tokenStorageService;
  AuthBloc({required TokenStorageServices tokenStorageService})
      : _tokenStorageService = tokenStorageService,
        super(AuthState.initial()) {
    on<CheckAuthStatus>(checkAuthStatusEvent);
    on<SignOutRequested>(signOutRequestedEvent);
  }

  Future<void> checkAuthStatusEvent(
      CheckAuthStatus event, Emitter<AuthState> emit) async {
    final token = await _tokenStorageService.getToken();

    if (token != null) {
      emit(state.copyWith(
        authStateStatus: AuthStateStatus.authAuthenticated,
      ));
    } else {
      emit(state.copyWith(
        authStateStatus: AuthStateStatus.authUnauthenticated,
      ));
    }
  }

  Future<void> signOutRequestedEvent(
      SignOutRequested event, Emitter<AuthState> emit) async {
    await _tokenStorageService.removeToken();
    emit(state.copyWith(authStateStatus: AuthStateStatus.authUnauthenticated));
  }
}
