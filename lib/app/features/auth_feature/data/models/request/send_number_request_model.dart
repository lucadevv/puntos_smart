import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/send_number_entity.dart';

class SendNumberRequestModel {
  final String sendData;
  final String type;

  SendNumberRequestModel({
    required this.sendData,
    required this.type,
  });

  SendNumberRequestModel copyWith({
    String? sendData,
    String? type,
  }) =>
      SendNumberRequestModel(
        sendData: sendData ?? this.sendData,
        type: type ?? this.type,
      );

  factory SendNumberRequestModel.fromJson(Map<String, dynamic> json) =>
      SendNumberRequestModel(
        sendData: json["sendData"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "sendData": sendData,
        "type": type,
      };

  factory SendNumberRequestModel.entityToMode(
      {required SendNumberEntity entity}) {
    return SendNumberRequestModel(
      sendData: entity.sendData,
      type: entity.type,
    );
  }
}
