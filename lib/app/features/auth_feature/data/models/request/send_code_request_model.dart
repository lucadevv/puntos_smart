import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/send_codeotp_entity.dart';

class SendCodeRequestModel {
  final String phone;
  final String code;

  SendCodeRequestModel({
    required this.phone,
    required this.code,
  });

  SendCodeRequestModel copyWith({
    String? phone,
    String? code,
  }) =>
      SendCodeRequestModel(
        phone: phone ?? this.phone,
        code: code ?? this.code,
      );

  factory SendCodeRequestModel.fromJson(Map<String, dynamic> json) =>
      SendCodeRequestModel(
        phone: json["phone"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "code": code,
      };

  factory SendCodeRequestModel.entityToMode(
          {required SendCodeOtpEntity entity}) =>
      SendCodeRequestModel(
        phone: entity.phone,
        code: entity.code,
      );
}
