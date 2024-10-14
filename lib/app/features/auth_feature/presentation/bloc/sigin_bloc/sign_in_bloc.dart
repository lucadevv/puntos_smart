import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puntos_smart_user/app/api/services_token/token_storage_services.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/sign_in_entity.dart';
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
    on<SignInPhoneNumberChanged>(_signInPhoneNumberChanged);
    on<SignInPasswordChanged>(_signInPasswordChangedEvent);
    on<SignInTermsChanged>(_signInTermsChangedEvent);
    on<SaveCredentials>(_saveCredentialsEvent);
    on<LoadSavedCredentials>(_loadSavedCredentialsEvent);
    on<ClearCredentials>(_clearCredentialsEvent);
    on<ClearUserAndPassword>(_clearUserAndPasswordEvent);
  }

  /*
  ------------------------CHANGED FORM SIGNIN------------------------
   */

  Future<void> _signInPhoneNumberChanged(
      SignInPhoneNumberChanged event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
        phone: event.number,
        signInStatus: SignInStatus.initial,
        errorPhone: _validatePhone(event.number) ?? ""));
  }

  Future<void> _signInPasswordChangedEvent(
      SignInPasswordChanged event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
      password: event.password,
      signInStatus: SignInStatus.initial,
    ));
  }

  Future<void> _signInTermsChangedEvent(
      SignInTermsChanged event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
      rememberCheck: event.rememberCheck,
      signInStatus: SignInStatus.initial,
    ));
  }

  /*
  ------------------------REQUEST SIGNIN------------------------
   */

  Future<void> _signInRequestedEvent(
      SignInRequested event, Emitter<SignInState> emit) async {
    emit(state.copyWith(signInStatus: SignInStatus.loading));

    try {
      final signInEntity =
          SignInEntity(phone: "+51${state.phone}", password: state.password);
      final result = await _authRepository.signIn(signInEntity: signInEntity);
      if (result is SignInSuccess) {
        await _tokenStorageServices
            .saveToken(result.signInResponseEntity.accessToken);
        if (state.rememberCheck) {
          add(SaveCredentials());
        } else {
          add(ClearCredentials());
        }
        emit(state.copyWith(
          signInStatus: SignInStatus.success,
        ));

        _authBloc.add(CheckAuthStatus());
      } else if (result is SignInFailure) {
        switch (result.signInFailureStatus) {
          case SignInFailureStatus.unAuthorized:
            emit(state.copyWith(signInStatus: SignInStatus.invalidCredentials));
            break;
          case SignInFailureStatus.notFound:
            emit(state.copyWith(signInStatus: SignInStatus.notFound));
            break;
          case SignInFailureStatus.network:
            emit(state.copyWith(signInStatus: SignInStatus.networkError));
            break;
          case SignInFailureStatus.server:
            emit(state.copyWith(signInStatus: SignInStatus.failure));
            break;
          case SignInFailureStatus.unknown:
          default:
            emit(state.copyWith(signInStatus: SignInStatus.unknown));
            break;
        }
      }
    } catch (e) {
      emit(state.copyWith(signInStatus: SignInStatus.failure));
    }
  }

  /*
  ------------------------TOKEN SERVICES SIGNIN------------------------
   */

  Future<void> _saveCredentialsEvent(
      SaveCredentials event, Emitter<SignInState> emit) async {
    final phone = state.phone;
    final password = state.password;
    await _tokenStorageServices.saveLoginInfo(phone, password);
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
        phone: loginInfo['saved_user']!,
        password: loginInfo['saved_password']!,
        rememberCheck: true,
      ));
    }
  }

  Future<void> _clearUserAndPasswordEvent(
      ClearUserAndPassword event, Emitter<SignInState> emit) async {
    emit(SignInState.initial());
  }

  /*
  ------------------------VALIDATIONS SIGN IP------------------------
   */

  String? _validatePhone(String phone) {
    if (phone.isEmpty) return 'El nombre de usuario es requerido';
    return null;
  }
}
