import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/sign_up_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/update_password_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_up_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/update_password_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/cubit/cubit/send_number_cubit.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;
  final SendNumberCubit _sendNumberCubit;
  SignupBloc(
      {required AuthRepository authRepository,
      required SendNumberCubit sendNumberCubit})
      : _authRepository = authRepository,
        _sendNumberCubit = sendNumberCubit,
        super(SignupState.initial()) {
    on<UserNameChangedSignUp>(_userNameChangedSignUpEvent);
    on<MailChangedSignUp>(_mailChangedSignUpEvent);
    on<PasswordChangedSignUp>(_passwordChangedSignUpEvent);
    on<ConfirmPasswordChangedSignUp>(_confirmPasswordChangedSignUpEvent);
    on<ReferCodeChangedSignUp>(_referCodeChangedSignUp);
    on<TermsCondsChangedSignUp>(_termsCondsChangedSignUpEvent);
    on<SignUpResquest>(_signUpResquestEvent);
    on<ForgotResquest>(_forgotResquestEvent);
  }

  /*
  ------------------------CHANGED TEXTFROMFIELD SIGN UP------------------------
   */

  Future<void> _userNameChangedSignUpEvent(
      UserNameChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
      userName: event.userName,
      userNameError: _validateUserName(event.userName) ?? "",
      signUpStatus: SignUpStatus.initial,
    ));
  }

  Future<void> _mailChangedSignUpEvent(
      MailChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
      mail: event.mail,
      mailError: _validateEmail(event.mail) ?? "",
      signUpStatus: SignUpStatus.initial,
    ));
  }

  Future<void> _passwordChangedSignUpEvent(
      PasswordChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
      password: event.password,
      passwordError: _validatePassword(event.password) ?? "",
      signUpStatus: SignUpStatus.initial,
      resetPasswordStatus: ResetPasswordStatus.initial,
    ));
  }

  Future<void> _confirmPasswordChangedSignUpEvent(
      ConfirmPasswordChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
      confirmPassword: event.confirmPassword,
      confirmPasswordError: _validatePassword(event.confirmPassword) ?? "",
      signUpStatus: SignUpStatus.initial,
      resetPasswordStatus: ResetPasswordStatus.initial,
    ));
  }

  Future<void> _referCodeChangedSignUp(
      ReferCodeChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
      referenceCode: event.referenceCode,
      signUpStatus: SignUpStatus.initial,
    ));
  }

  Future<void> _termsCondsChangedSignUpEvent(
      TermsCondsChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
      termnsAndConditions: event.terms,
      signUpStatus: SignUpStatus.initial,
    ));
  }

  /*
  ------------------------REQUEST SIGN UP------------------------
   */

  Future<void> _signUpResquestEvent(
      SignUpResquest event, Emitter<SignupState> emit) async {
    if (state.password != state.confirmPassword) {
      emit(state.copyWith(signUpStatus: SignUpStatus.passwordNotEqual));
      return;
    }
    if (!state.termnsAndConditions) {
      emit(state.copyWith(signUpStatus: SignUpStatus.termsNotAccepted));
      return;
    }
    final uuid = _sendNumberCubit.state.verifyCodeOtpEntity.uuid;

    if (uuid.isNotEmpty) {
      emit(
        state.copyWith(signUpStatus: SignUpStatus.loading),
      );
      try {
        final signUpEntity = SignUpEntity(
          uuid: uuid,
          email: state.mail,
          alias: state.userName,
          password: state.password,
          confirmPassword: state.confirmPassword,
          referalCode: state.referenceCode,
        );
        final response =
            await _authRepository.signUp(signUpEntity: signUpEntity);
        if (response is SignUpSuccess) {
          emit(
            state.copyWith(signUpStatus: SignUpStatus.success),
          );
          emit(SignupState.initial());
        } else if (response is SignUpFailure) {
          __handleSingUpFailure(response.signUpFailureStatus, emit);
        }
      } catch (e) {
        emit(
          state.copyWith(signUpStatus: SignUpStatus.unknown),
        );
      }
    } else {
      emit(
        state.copyWith(signUpStatus: SignUpStatus.userRegister),
      );
    }
  }

  /*
  ------------------------REQUEST FORGOT PASSWORD------------------------
   */

  Future<void> _forgotResquestEvent(
      ForgotResquest event, Emitter<SignupState> emit) async {
    if (state.password != state.confirmPassword) {
      emit(state.copyWith(
          resetPasswordStatus: ResetPasswordStatus.passwordNotEqual));
      return;
    }

    final uuid = _sendNumberCubit.state.verifyCodeOtpEntity.uuid;

    if (uuid.isNotEmpty) {
      emit(
        state.copyWith(resetPasswordStatus: ResetPasswordStatus.loading),
      );
      try {
        final updatePasswordEntity = UpdatePasswordEntity(
          uuid: uuid,
          password: state.password,
          confirmPassword: state.confirmPassword,
        );
        final response = await _authRepository.updatePassword(
            updatePasswordEntity: updatePasswordEntity);
        if (response is UpdatePasswordSuccess) {
          emit(
            state.copyWith(resetPasswordStatus: ResetPasswordStatus.success),
          );
          emit(SignupState.initial());
        } else if (response is UpdatePasswordFailure) {
          __handleUpdatePassowrdFailure(
              response.updatePasswordFailureStatus, emit);
        }
      } catch (e) {
        emit(
          state.copyWith(signUpStatus: SignUpStatus.unknown),
        );
      }
    } else {
      emit(
        state.copyWith(signUpStatus: SignUpStatus.userRegister),
      );
    }
  }

  /*
  ------------------------VALIDATIONS SIGN UP------------------------
   */

  String? _validateUserName(String userName) {
    if (userName.isEmpty) return 'El nombre de usuario es requerido';
    return null;
  }

  String? _validateEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(email)) {
      return 'Correo no válido';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }
  /*
  ------------------------CUSTOM FAILURES SIGN UP------------------------
   */

  void __handleSingUpFailure(
    SignUpFailureStatus signUpFailureStatus,
    Emitter<SignupState> emit,
  ) {
    switch (signUpFailureStatus) {
      case SignUpFailureStatus.network:
        emit(state.copyWith(signUpStatus: SignUpStatus.network));
        break;
      case SignUpFailureStatus.server:
        emit(state.copyWith(signUpStatus: SignUpStatus.server));
        break;
      case SignUpFailureStatus.emailAlreadyInUse:
        emit(state.copyWith(signUpStatus: SignUpStatus.emailAlreadyInUse));
        break;
      case SignUpFailureStatus.invalidEmail:
        emit(state.copyWith(signUpStatus: SignUpStatus.invalidEmail));
        break;
      case SignUpFailureStatus.userExist:
        emit(state.copyWith(signUpStatus: SignUpStatus.userExist));
        break;
      case SignUpFailureStatus.userRegister:
        emit(state.copyWith(signUpStatus: SignUpStatus.userRegister));
        break;
      case SignUpFailureStatus.termsNotAccepted:
        emit(state.copyWith(signUpStatus: SignUpStatus.termsNotAccepted));
        break;
      default:
        emit(state.copyWith(signUpStatus: SignUpStatus.unknown));
        break;
    }
  }

  void __handleUpdatePassowrdFailure(
    UpdatePasswordFailureStatus updatePasswordFailureStatus,
    Emitter<SignupState> emit,
  ) {
    switch (updatePasswordFailureStatus) {
      case UpdatePasswordFailureStatus.network:
        emit(state.copyWith(resetPasswordStatus: ResetPasswordStatus.network));
        break;
      case UpdatePasswordFailureStatus.server:
        emit(state.copyWith(resetPasswordStatus: ResetPasswordStatus.server));
        break;
      case UpdatePasswordFailureStatus.userNotFound:
        emit(state.copyWith(
            resetPasswordStatus: ResetPasswordStatus.userNotFound));
        break;
      case UpdatePasswordFailureStatus.passwordNotEqual:
        emit(state.copyWith(resetPasswordStatus: ResetPasswordStatus.server));
        break;
      case UpdatePasswordFailureStatus.weakPassword:
        emit(state.copyWith(resetPasswordStatus: ResetPasswordStatus.server));
        break;

      default:
        emit(state.copyWith(resetPasswordStatus: ResetPasswordStatus.unknown));
        break;
    }
  }
}
