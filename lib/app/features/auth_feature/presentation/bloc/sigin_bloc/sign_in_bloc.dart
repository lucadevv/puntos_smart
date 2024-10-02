import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puntos_smart_user/app/api/services_token/token_storage_services.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_in_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_in_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;
  final TokenStorageServices _tokenStorageServices;
  final AuthBloc _authBloc;
  SignInBloc({
    required AuthRepository authRepository,
    required TokenStorageServices tokenStorageServices,
    required AuthBloc authBloc,
  })  : _authRepository = authRepository,
        _tokenStorageServices = tokenStorageServices,
        _authBloc = authBloc,
        super(SignInState.initial()) {
    on<SignInRequested>(_signInRequestedEvent);
    on<SignInEmailChanged>(_signInEmailChangedEvent);
    on<SignInPasswordChanged>(_signInPasswordChangedEvent);
    on<SignInTermsChanged>(_signInTermsChangedEvent);
    on<SaveCredentials>(_saveCredentialsEvent);
    on<LoadSavedCredentials>(_loadSavedCredentialsEvent);
    on<ClearCredentials>(_clearCredentialsEvent);
    on<ClearUserAndPassword>(_clearUserAndPasswordEvent);
  }

  Future<void> _signInRequestedEvent(
      SignInRequested event, Emitter<SignInState> emit) async {
    emit(state.copyWith(signInStatus: SignInStatus.loading));
    try {
      final result =
          await _authRepository.signIn(signInModel: event.signInEntity);
      if (result is SignInSuccess) {
        await _tokenStorageServices.saveToken(result.accessToken);

        emit(state.copyWith(
          signInStatus: SignInStatus.success,
        ));

        _authBloc.add(CheckAuthStatus());
        if (state.rememberCheck) {
          add(SaveCredentials());
        } else {
          add(ClearCredentials());
        }
      } else if (result is SignInFailure) {
        switch (result.signInFailureStatus) {
          case SignInFailureStatus.unAuthorized:
            emit(state.copyWith(signInStatus: SignInStatus.invalidCredentials));
            break;
          case SignInFailureStatus.network:
            emit(state.copyWith(signInStatus: SignInStatus.networkError));
            break;
          case SignInFailureStatus.server:
            emit(state.copyWith(signInStatus: SignInStatus.failure));
            break;
          case SignInFailureStatus.unknown:
          default:
            emit(state.copyWith(signInStatus: SignInStatus.failure));
            break;
        }
      }
    } catch (e) {
      emit(state.copyWith(signInStatus: SignInStatus.failure));
    }
  }

  Future<void> _signInEmailChangedEvent(
      SignInEmailChanged event, Emitter<SignInState> emit) async {
    emit(state.copyWith(user: event.user));
  }

  Future<void> _signInPasswordChangedEvent(
      SignInPasswordChanged event, Emitter<SignInState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _signInTermsChangedEvent(
      SignInTermsChanged event, Emitter<SignInState> emit) async {
    emit(state.copyWith(rememberCheck: event.rememberCheck));
  }

  Future<void> _saveCredentialsEvent(
      SaveCredentials event, Emitter<SignInState> emit) async {
    final user = state.user;
    final password = state.password;
    await _tokenStorageServices.saveLoginInfo(user, password);
  }

  Future<void> _clearCredentialsEvent(
      ClearCredentials event, Emitter<SignInState> emit) async {
    await _tokenStorageServices.clearLoginInfo();
  }

  Future<void> _loadSavedCredentialsEvent(
      LoadSavedCredentials event, Emitter<SignInState> emit) async {
    final loginInfo = await _tokenStorageServices.getLoginInfo();

    if (loginInfo['saved_user'] != null &&
        loginInfo['saved_password'] != null) {
      emit(state.copyWith(
        user: loginInfo['saved_user']!,
        password: loginInfo['saved_password']!,
        rememberCheck: true,
      ));
    }
  }

  Future<void> _clearUserAndPasswordEvent(
      ClearUserAndPassword event, Emitter<SignInState> emit) async {
    emit(SignInState.initial());
  }
}
