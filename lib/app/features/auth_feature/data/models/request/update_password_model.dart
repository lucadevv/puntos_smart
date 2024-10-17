import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/update_password_entity.dart';

class UpdatePasswordModel {
  final String uuid;
  final String password;
  final String confirmPassword;

  UpdatePasswordModel({
    required this.uuid,
    required this.password,
    required this.confirmPassword,
  });

  UpdatePasswordModel copyWith({
    String? uuid,
    String? password,
    String? confirmPassword,
  }) =>
      UpdatePasswordModel(
        uuid: uuid ?? this.uuid,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
      );

  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordModel(
        uuid: json["uuid"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "password": password,
        "confirm_password": confirmPassword,
      };

  factory UpdatePasswordModel.entityToModel(
          {required UpdatePasswordEntity entity}) =>
      UpdatePasswordModel(
        uuid: entity.uuid,
        password: entity.password,
        confirmPassword: entity.confirmPassword,
      );
}
