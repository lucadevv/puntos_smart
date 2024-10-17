import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/sign_in_entity.dart';

class SignInModel {
  final String phone;
  final String password;

  SignInModel({
    required this.phone,
    required this.password,
  });

  SignInModel copyWith({
    String? phone,
    String? password,
  }) =>
      SignInModel(
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
      };
  factory SignInModel.entityToModel({required SignInEntity entity}) =>
      SignInModel(
        phone: entity.phone,
        password: entity.password,
      );
}
