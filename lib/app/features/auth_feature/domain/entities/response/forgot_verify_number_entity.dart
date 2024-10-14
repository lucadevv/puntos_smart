import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/forgot_verify_number_model.dart';

class ForgotVerifyNumberEntity {
  final String status;
  final String phone;
  final int otpcode;
  final String message;

  ForgotVerifyNumberEntity({
    required this.status,
    required this.phone,
    required this.otpcode,
    required this.message,
  });

  ForgotVerifyNumberEntity copyWith({
    String? status,
    String? phone,
    int? otpcode,
    String? message,
  }) =>
      ForgotVerifyNumberEntity(
        status: status ?? this.status,
        phone: phone ?? this.phone,
        otpcode: otpcode ?? this.otpcode,
        message: message ?? this.message,
      );

  factory ForgotVerifyNumberEntity.fromJson(Map<String, dynamic> json) =>
      ForgotVerifyNumberEntity(
        status: json["status"],
        phone: json["phone"],
        otpcode: json["otpcode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "phone": phone,
        "otpcode": otpcode,
        "message": message,
      };

  factory ForgotVerifyNumberEntity.modelToEntity(
          {required ForgoutVerifyNumberModel model}) =>
      ForgotVerifyNumberEntity(
        status: model.status,
        phone: model.phone,
        otpcode: model.otpcode,
        message: model.message,
      );
  factory ForgotVerifyNumberEntity.empty() => ForgotVerifyNumberEntity(
        status: "",
        phone: "",
        otpcode: 0,
        message: "",
      );
}
