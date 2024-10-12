import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/send_number_entity.dart';

class SendNumberRequestModel {
  final String phone;

  SendNumberRequestModel({
    required this.phone,
  });

  SendNumberRequestModel copyWith({
    String? phone,
  }) =>
      SendNumberRequestModel(
        phone: phone ?? this.phone,
      );

  factory SendNumberRequestModel.fromJson(Map<String, dynamic> json) =>
      SendNumberRequestModel(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };

  factory SendNumberRequestModel.entityToModel(
      {required SendNumberEntity entity}) {
    return SendNumberRequestModel(phone: entity.phone);
  }
}
