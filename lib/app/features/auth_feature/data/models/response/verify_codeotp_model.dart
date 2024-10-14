class VerifyCodeOtpModel {
  final String status;
  final String phone;
  final String otpcode;
  final int? password; // Hacemos password opcional
  final String uuid;
  final String message;

  VerifyCodeOtpModel({
    required this.status,
    required this.phone,
    required this.otpcode,
    this.password, // Es opcional
    required this.uuid,
    required this.message,
  });

  VerifyCodeOtpModel copyWith({
    String? status,
    String? phone,
    String? otpcode,
    int? password, // Es opcional
    String? uuid,
    String? message,
  }) =>
      VerifyCodeOtpModel(
        status: status ?? this.status,
        phone: phone ?? this.phone,
        otpcode: otpcode ?? this.otpcode,
        password: password ?? this.password,
        uuid: uuid ?? this.uuid,
        message: message ?? this.message,
      );

  // Ajustamos para que password sea opcional y se maneje como null si no existe
  factory VerifyCodeOtpModel.fromJson(Map<String, dynamic> json) =>
      VerifyCodeOtpModel(
        status: json["status"],
        phone: json["phone"],
        otpcode: json["otpcode"],
        password: json["password"] != null
            ? json["password"] as int?
            : null, // Si no existe, asigna null
        uuid: json["uuid"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "phone": phone,
        "otpcode": otpcode,
        "password": password, // Puede ser null en el JSON
        "uuid": uuid,
        "message": message,
      };
}
