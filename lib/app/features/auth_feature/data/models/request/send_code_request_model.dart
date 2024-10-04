import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/send_code_entity.dart';

class SendCodeRequestModel {
  final String number;
  final String code;

  SendCodeRequestModel({
    required this.number,
    required this.code,
  });

  SendCodeRequestModel copyWith({
    String? number,
    String? code,
  }) =>
      SendCodeRequestModel(
        number: number ?? this.number,
        code: code ?? this.code,
      );

  factory SendCodeRequestModel.fromJson(Map<String, dynamic> json) =>
      SendCodeRequestModel(
        number: json["number"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "code": code,
      };
  factory SendCodeRequestModel.entityToMode(
          {required SendCodeRequestEntity entity}) =>
      SendCodeRequestModel(
        number: entity.number,
        code: entity.code,
      );
}
