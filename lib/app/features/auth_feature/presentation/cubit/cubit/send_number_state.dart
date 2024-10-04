part of 'send_number_cubit.dart';

class SendNumberState extends Equatable {
  final String phoneNumber;
  final String codeVerifiaction;
  final SendNumberStatus sendNumberStatus;
  final SendCodeStatus sendCodeStatus;

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
      );
  factory SendNumberState.initial() => const SendNumberState(
        phoneNumber: '',
        sendNumberStatus: SendNumberStatus.initial,
        numberOne: '',
        numberTwo: '',
        numberThree: '',
        numberFour: '',
        sendCodeStatus: SendCodeStatus.initial,
        codeVerifiaction: '',
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
      ];
}

enum SendNumberStatus {
  initial,
  loading,
  success,
  network, // Error de red
  notFound, // Error 404 o similar
  server, // Error de servidor (500)
  phoneNumberExist, // Numero ya existe
  activeCodeExpiration, //expiracion de codigo activo
  invalidNumber, //numero invalido
  invalidData, //Invalid data
  unknown // Error desconocido
}

enum SendCodeStatus {
  initial,
  loading,
  success,
  network, // Error de red
  server, // Error de servidor (500)
  invalidCode, //numero invalido
  unknown // Error desconocido
}
