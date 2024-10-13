import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/sign_in_entity.dart';

class SignInModel {
  final String email;
  final String password;

  SignInModel({
    required this.email,
    required this.password,
  });

  factory SignInModel.entityToModel({required SignInEntity entity}) {
    return SignInModel(email: entity.phone, password: entity.password);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
