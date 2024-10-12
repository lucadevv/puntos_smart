part of 'send_number_cubit.dart';

class SendNumberState extends Equatable {
  final String phoneNumber;
  final String codeVerifiaction;
  final SendNumberStatus sendNumberStatus;
  final SendCodeStatus sendCodeStatus;
  final VerifyNumberEntity verifyNumberEntity;
  final VerifyCodeOtpEntity verifyCodeOtpEntity;
  final String numberOne;
  final String numberTwo;
  final String numberThree;
  final String numberFour;

  const SendNumberState({
    required this.phoneNumber,
    required this.sendNumberStatus,
    required this.numberOne,
    required this.numberTwo,
    required this.numberThree,
    required this.numberFour,
    required this.sendCodeStatus,
    required this.codeVerifiaction,
    required this.verifyNumberEntity,
    required this.verifyCodeOtpEntity,
  });

  SendNumberState copyWith({
    String? phoneNumber,
    SendNumberStatus? sendNumberStatus,
    String? numberOne,
    String? numberTwo,
    String? numberThree,
    String? numberFour,
    int? starTime,
    SendCodeStatus? sendCodeStatus,
    String? codeVerifiaction,
    VerifyNumberEntity? verifyNumberEntity,
    VerifyCodeOtpEntity? verifyCodeOtpEntity,
  }) =>
      SendNumberState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        sendNumberStatus: sendNumberStatus ?? this.sendNumberStatus,
        numberOne: numberOne ?? this.numberOne,
        numberTwo: numberTwo ?? this.numberTwo,
        numberThree: numberThree ?? this.numberThree,
        numberFour: numberFour ?? this.numberFour,
        sendCodeStatus: sendCodeStatus ?? this.sendCodeStatus,
        codeVerifiaction: codeVerifiaction ?? this.codeVerifiaction,
        verifyNumberEntity: verifyNumberEntity ?? this.verifyNumberEntity,
        verifyCodeOtpEntity: verifyCodeOtpEntity ?? this.verifyCodeOtpEntity,
      );
  factory SendNumberState.initial() => SendNumberState(
        phoneNumber: '',
        sendNumberStatus: SendNumberStatus.initial,
        numberOne: '',
        numberTwo: '',
        numberThree: '',
        numberFour: '',
        sendCodeStatus: SendCodeStatus.initial,
        codeVerifiaction: '',
        verifyNumberEntity: VerifyNumberEntity.empty(),
        verifyCodeOtpEntity: VerifyCodeOtpEntity.empty(),
      );

  @override
  List<Object> get props => [
        phoneNumber,
        sendNumberStatus,
        numberOne,
        numberTwo,
        numberThree,
        numberFour,
        sendCodeStatus,
        codeVerifiaction,
        verifyNumberEntity,
        verifyCodeOtpEntity
      ];
}

enum SendNumberStatus {
  initial,
  loading,
  success,
  network, // Error de red
  notFound, // Error 404 o similar
  server, // Error de servidor (500)
  verifyNumber, // Numero ya existe
  invalidNumber, //numero invalido
  waitingVerification, //El número encuentra se encuentra en proceso de verificación.
  unknown // Error desconocido
}

enum SendCodeStatus {
  initial,
  loading,
  success,
  network, // Error de red
  server, // Error de servidor (500)
  invalidCode, //numero invalido
  expiredCode, //codigo otp expirado
  alredyVerified, // codigo y numero ya verificado
  unknown // Error desconocido
}
