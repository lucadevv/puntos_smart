import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_up_entity.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState.initial()) {
    on<NameChangedSignUp>(_nameChangedSignUpEvent);
    on<LastNameChangedSignUp>(_lastNameChangedSignUpEvent);
    on<MailChangedSignUp>(_mailChangedSignUpEvent);
    on<PasswordChangedSignUp>(_passwordChangedSignUpEvent);
    on<ConfirmPasswordChangedSignUp>(_confirmPasswordChangedSignUpEvent);
    on<NumberPhoneChangedSignUp>(_numberPhoneChangedSignUpEvent);
    on<SignUpResquest>(_signUpResquestEvent);
    on<TermsCondsChangedSignUp>(_termsCondsChangedSignUpEvent);
  }

  Future<void> _nameChangedSignUpEvent(
      NameChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(name: event.name, signUpStatus: SignUpStatus.initial));
  }

  Future<void> _lastNameChangedSignUpEvent(
      LastNameChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
        lastName: event.lastName, signUpStatus: SignUpStatus.initial));
  }

  Future<void> _mailChangedSignUpEvent(
      MailChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(mail: event.mail, signUpStatus: SignUpStatus.initial));
  }

  Future<void> _passwordChangedSignUpEvent(
      PasswordChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
        password: event.password, signUpStatus: SignUpStatus.initial));
  }

  Future<void> _confirmPasswordChangedSignUpEvent(
      ConfirmPasswordChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
        confirmPassword: event.confirmPassword,
        signUpStatus: SignUpStatus.initial));
  }

  Future<void> _numberPhoneChangedSignUpEvent(
      NumberPhoneChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
        numberPhone: event.numberPhone, signUpStatus: SignUpStatus.initial));
  }

  Future<void> _termsCondsChangedSignUpEvent(
      TermsCondsChangedSignUp event, Emitter<SignupState> emit) async {
    emit(state.copyWith(
        termnsAndConditions: event.terms, signUpStatus: SignUpStatus.initial));
  }

  Future<void> _signUpResquestEvent(
      SignUpResquest event, Emitter<SignupState> emit) async {
    emit(state.copyWith(signUpStatus: SignUpStatus.loading));
    try {} catch (e) {
      emit(state.copyWith(signUpStatus: SignUpStatus.failure));
    }
  }
}
