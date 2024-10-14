import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/update_password_response_model.dart';

class UpdatePasswordResponseEntity {
  final String message;
  final String status;
  final String uuid;

  UpdatePasswordResponseEntity({
    required this.message,
    required this.status,
    required this.uuid,
  });

  UpdatePasswordResponseEntity copyWith({
    String? message,
    String? status,
    String? uuid,
  }) =>
      UpdatePasswordResponseEntity(
        message: message ?? this.message,
        status: status ?? this.status,
        uuid: uuid ?? this.uuid,
      );

  factory UpdatePasswordResponseEntity.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordResponseEntity(
        message: json["message"],
        status: json["status"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "uuid": uuid,
      };

  factory UpdatePasswordResponseEntity.modelToEntity(
          {required UpdatePasswordResponseModel model}) =>
      UpdatePasswordResponseEntity(
        message: model.message,
        status: model.status,
        uuid: model.uuid,
      );
}
