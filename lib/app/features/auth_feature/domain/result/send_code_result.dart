abstract class SendCodeResult {}

class SendCodeSucces extends SendCodeResult {
  final String status;
  final String message;

  SendCodeSucces({required this.status, required this.message});
}

class SendCodeFailure extends SendCodeResult {
  final SendCodeFailureStatus sendCodeFailureStatus;

  SendCodeFailure({required this.sendCodeFailureStatus});
}

enum SendCodeFailureStatus {
  network, // Error de red
  server, // Error de servidor (500)
  invalidCode, //numero invalido
  unknown // Error desconocido
}
