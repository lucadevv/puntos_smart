import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/send_code_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/send_number_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/send_code_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/send_number_result.dart';

part 'send_number_state.dart';

class SendNumberCubit extends Cubit<SendNumberState> {
  final AuthRepository _authRepository;
  SendNumberCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SendNumberState.initial());

  Future<void> requestNumber() async {
    emit(state.copyWith(sendNumberStatus: SendNumberStatus.loading));
    try {
      final phoneNumber = state.phoneNumber;
      final numberText = "+51${phoneNumber.toString()}";
      final sendNumberEntity =
          SendNumberEntity(sendData: numberText, type: "phone");
      final result =
          await _authRepository.sendNumber(sendNumberEntity: sendNumberEntity);
      if (result is SendNumberSuccess) {
        emit(state.copyWith(
          phoneNumber: phoneNumber,
          sendNumberStatus: SendNumberStatus.success,
        ));
      } else if (result is SendNumberFailure) {
        _handleSendNumberFailure(result.sendNumberFailureStatus);
      }
    } catch (e) {
      debugPrint('-------Error inesperado en el envio de numero $e');
      emit(state.copyWith(sendNumberStatus: SendNumberStatus.unknown));
    }
  }

  Future<void> requestCodeVerification() async {
    emit(state.copyWith(sendCodeStatus: SendCodeStatus.loading));
    try {
      final phoneNumber = state.phoneNumber;
      final numberText = "+51${phoneNumber.toString()}";
      final numberOne = state.numberOne;
      final numberTwo = state.numberTwo;
      final numberThree = state.numberThree;
      final numberFour = state.numberFour;
      final code = "$numberOne$numberTwo$numberThree$numberFour";

      final sendCodeRequestEntity =
          SendCodeRequestEntity(number: numberText, code: code);
      final result = await _authRepository.sendCode(
          sendCodeRequestEntity: sendCodeRequestEntity);
      if (result is SendCodeSucces) {
        emit(state.copyWith(
          phoneNumber: phoneNumber,
          codeVerifiaction: code,
          sendCodeStatus: SendCodeStatus.success,
        ));
      } else if (result is SendCodeFailure) {
        _handleSenCodeFailure(result.sendCodeFailureStatus);
      }
    } catch (e) {
      debugPrint(
          '-------Error inesperado en el envio de codigo de verificacion $e');
      emit(state.copyWith(sendCodeStatus: SendCodeStatus.unknown));
    }
  }

  Future<void> changedNumber({required String phoneNumber}) async {
    emit(state.copyWith(
      phoneNumber: phoneNumber,
      sendNumberStatus: SendNumberStatus.initial,
    ));
  }

  Future<void> changedNumberOne({required String number}) async {
    emit(state.copyWith(
      numberOne: number,
      sendNumberStatus: SendNumberStatus.initial,
    ));
  }

  Future<void> changedNumberTwo({required String number}) async {
    emit(state.copyWith(
      numberTwo: number,
      sendNumberStatus: SendNumberStatus.initial,
    ));
  }

  Future<void> changedNumberThree({required String number}) async {
    emit(state.copyWith(
      numberThree: number,
      sendNumberStatus: SendNumberStatus.initial,
    ));
  }

  Future<void> changedNumberFour({required String number}) async {
    emit(state.copyWith(
      numberFour: number,
      sendNumberStatus: SendNumberStatus.initial,
    ));
  }

  void _handleSenCodeFailure(SendCodeFailureStatus result) {
    switch (result) {
      case SendCodeFailureStatus.network:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.network));
        break;
      case SendCodeFailureStatus.server:
        break;
      case SendCodeFailureStatus.invalidCode:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.invalidData));
        break;
      case SendCodeFailureStatus.unknown:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.unknown));
        break;
      default:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.unknown));
        break;
    }
  }

  void _handleSendNumberFailure(SendNumberFailureStatus result) {
    switch (result) {
      case SendNumberFailureStatus.network:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.network));
        break;
      case SendNumberFailureStatus.notFound:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.notFound));
        break;
      case SendNumberFailureStatus.server:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.server));
        break;
      case SendNumberFailureStatus.phoneNumberExist:
        emit(state.copyWith(
            sendNumberStatus: SendNumberStatus.phoneNumberExist));
        break;
      case SendNumberFailureStatus.activeCodeExpiration:
        emit(state.copyWith(
            sendNumberStatus: SendNumberStatus.activeCodeExpiration));
        break;
      case SendNumberFailureStatus.invalidNumber:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.invalidNumber));
        break;
      case SendNumberFailureStatus.invalidData:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.invalidData));
        break;
      case SendNumberFailureStatus.unknown:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.unknown));
        break;
      default:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.unknown));
        break;
    }
  }
}
