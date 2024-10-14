import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puntos_smart_user/app/core/bloc/local_notification_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/send_codeotp_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/verify_codeotp_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/verify_number_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/send_number_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/verify_codeotp_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/verify_number_result.dart';

part 'send_number_state.dart';

class SendNumberCubit extends Cubit<SendNumberState> {
  final AuthRepository _authRepository;
  final LocalNotificationBloc _localNotificationBloc;
  SendNumberCubit(
      {required AuthRepository authRepository,
      required LocalNotificationBloc localNotificationBloc})
      : _authRepository = authRepository,
        _localNotificationBloc = localNotificationBloc,
        super(SendNumberState.initial());

  /*
  ------------------------CHANGED NUMBER CUBIT------------------------
   */

  Future<void> changedNumber({required String phoneNumber}) async {
    emit(state.copyWith(
      phoneNumber: phoneNumber,
      sendNumberStatus: SendNumberStatus.initial,
    ));
  }

  /*
  ------------------------CHANGED NUMBER OTP CUBIT------------------------
   */

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

  Future<void> resetStateInitial() async {
    emit(SendNumberState.initial());
  }
  /*
  ------------------------REQUEST NUMBER CUBIT------------------------
   */

  Future<void> requestNumber() async {
    emit(state.copyWith(sendNumberStatus: SendNumberStatus.loading));
    try {
      final phoneNumber = state.phoneNumber;
      final numberText = "+51${phoneNumber.toString()}";
      final sendNumberEntity = SendNumberEntity(phone: numberText);
      final result = await _authRepository.verifyNumber(
          sendNumberEntity: sendNumberEntity);

      if (result is VerifyNumberSuccess) {
        emit(state.copyWith(
          phoneNumber: phoneNumber,
          verifyNumberEntity: result.verifyNumberEntity,
          sendNumberStatus: SendNumberStatus.success,
        ));
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final otpCode = result.verifyNumberEntity.data.otpcode.toString();
          Future.delayed(const Duration(seconds: 1)).then((_) {
            _localNotificationBloc.add(SendLocalNotification(
              id: "1",
              title: "Verificación OTP",
              body: otpCode,
            ));
            emit(state.copyWith(sendNumberStatus: SendNumberStatus.initial));
          });
        });
      } else if (result is VerifyNumberFailure) {
        _handleSendNumberFailure(result.sendNumberFailureStatus);
      }
    } catch (e) {
      debugPrint('-------Error inesperado en el envio de numero $e');
      emit(state.copyWith(sendNumberStatus: SendNumberStatus.unknown));
    }
  }

  /*
  ------------------------REQUEST CODE CUBIT------------------------
   */

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

      final sendCodetEntity = SendCodeOtpEntity(phone: numberText, code: code);
      final result =
          await _authRepository.verifyCode(sendCodeOtpEntity: sendCodetEntity);
      if (result is VerifyCodeOtpSucces) {
        emit(state.copyWith(
          phoneNumber: phoneNumber,
          codeVerifiaction: code,
          verifyCodeOtpEntity: result.verifyCodeOtpEntity,
          sendCodeStatus: SendCodeStatus.success,
        ));
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final numerPhone = result.verifyCodeOtpEntity.phone;
          final password = result.verifyCodeOtpEntity.password.toString();
          Future.delayed(const Duration(seconds: 1)).then((_) {
            _localNotificationBloc.add(SendLocalNotification(
              id: "2",
              title: "Usuario: $numerPhone",
              body: "Password $password",
            ));
            emit(state.copyWith(sendCodeStatus: SendCodeStatus.initial));
          });
        });
      } else if (result is VerifyCodeOtpFailure) {
        _handleSenCodeFailure(result.verifyCodeOtpFailureStatus);
      }
    } catch (e) {
      debugPrint(
          '-------Error inesperado en el envio de codigo de verificacion $e');
      emit(state.copyWith(sendCodeStatus: SendCodeStatus.unknown));
    }
  }

  /*
  ------------------------CUSTOM FAILURES CUBIT------------------------
   */

  void _handleSenCodeFailure(VerifyCodeOtpFailureStatus result) {
    switch (result) {
      case VerifyCodeOtpFailureStatus.network:
        emit(state.copyWith(sendCodeStatus: SendCodeStatus.network));
        break;
      case VerifyCodeOtpFailureStatus.server:
        emit(state.copyWith(sendCodeStatus: SendCodeStatus.server));
        break;
      case VerifyCodeOtpFailureStatus.invalidCode:
        emit(state.copyWith(sendCodeStatus: SendCodeStatus.invalidCode));
        break;
      case VerifyCodeOtpFailureStatus.expiredCode:
        emit(state.copyWith(sendCodeStatus: SendCodeStatus.expiredCode));
        break;
      case VerifyCodeOtpFailureStatus.alredyVerified:
        emit(state.copyWith(sendCodeStatus: SendCodeStatus.alredyVerified));
        break;
      default:
        emit(state.copyWith(sendCodeStatus: SendCodeStatus.unknown));
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
      case SendNumberFailureStatus.invalidNumber:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.invalidNumber));
        break;
      case SendNumberFailureStatus.verifyNumber:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.verifyNumber));
        break;

      case SendNumberFailureStatus.waitingVerification:
        emit(state.copyWith(
            sendNumberStatus: SendNumberStatus.waitingVerification));
        break;
      default:
        emit(state.copyWith(sendNumberStatus: SendNumberStatus.unknown));
        break;
    }
  }
}
