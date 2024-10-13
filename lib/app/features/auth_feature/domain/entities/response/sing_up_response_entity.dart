import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/singup_response_model.dart';

class SignUpResponseEntity {
  final String message;
  final String status;
  final String uuid;

  SignUpResponseEntity({
    required this.message,
    required this.status,
    required this.uuid,
  });

  SignUpResponseEntity copyWith({
    String? message,
    String? status,
    String? uuid,
  }) =>
      SignUpResponseEntity(
        message: message ?? this.message,
        status: status ?? this.status,
        uuid: uuid ?? this.uuid,
      );

  factory SignUpResponseEntity.fromJson(Map<String, dynamic> json) =>
      SignUpResponseEntity(
        message: json["message"],
        status: json["status"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "uuid": uuid,
      };
  factory SignUpResponseEntity.modelToEntity(
          {required SignUpResponseModel model}) =>
      SignUpResponseEntity(
        message: model.message,
        status: model.status,
        uuid: model.uuid,
      );
}
