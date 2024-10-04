abstract class SendNumberResult {}

class SendNumberSuccess extends SendNumberResult {
  final String status;
  final String message;

  SendNumberSuccess({required this.status, required this.message});
}

class SendNumberFailure extends SendNumberResult {
  final SendNumberFailureStatus sendNumberFailureStatus;
  SendNumberFailure({required this.sendNumberFailureStatus});
}

enum SendNumberFailureStatus {
  network, // Error de red
  notFound, // Error 404 o similar
  server, // Error de servidor (500)
  phoneNumberExist, // Numero ya existe
  activeCodeExpiration, //expiracion de codigo activo
  invalidNumber, //numero invalido
  invalidData, //Invalid data
  unknown // Error desconocido
}
