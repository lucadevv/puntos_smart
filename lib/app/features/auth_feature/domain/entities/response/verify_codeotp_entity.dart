import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/verify_codeotp_model.dart';

class VerifyCodeOtpEntity {
  final String status;
  final String phone;
  final String otpcode;
  final int? password; // Hacemos password opcional
  final String uuid;
  final String message;

  VerifyCodeOtpEntity({
    required this.status,
    required this.phone,
    required this.otpcode,
    this.password, // Es opcional
    required this.uuid,
    required this.message,
  });

  VerifyCodeOtpEntity copyWith({
    String? status,
    String? phone,
    String? otpcode,
    int? password, // Es opcional en copyWith también
    String? uuid,
    String? message,
  }) =>
      VerifyCodeOtpEntity(
        status: status ?? this.status,
        phone: phone ?? this.phone,
        otpcode: otpcode ?? this.otpcode,
        password: password ?? this.password,
        uuid: uuid ?? this.uuid,
        message: message ?? this.message,
      );

  // Ajuste en fromJson para que password sea opcional
  factory VerifyCodeOtpEntity.fromJson(Map<String, dynamic> json) =>
      VerifyCodeOtpEntity(
        status: json["status"],
        phone: json["phone"],
        otpcode: json["otpcode"],
        password: json["password"] != null
            ? json["password"] as int?
            : null, // Maneja si password es null o no existe
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

  factory VerifyCodeOtpEntity.modelToEntity(
      {required VerifyCodeOtpModel model}) {
    return VerifyCodeOtpEntity(
      status: model.status,
      phone: model.phone,
      otpcode: model.otpcode,
      password: model.password,
      uuid: model.uuid,
      message: model.message,
    );
  }

  factory VerifyCodeOtpEntity.empty() => VerifyCodeOtpEntity(
        status: "",
        phone: "",
        otpcode: "",
        password: null, // Puede ser null cuando está vacío
        uuid: "",
        message: "",
      );
}
