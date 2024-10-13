// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/sign_up_entity.dart';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  final String uuid;
  final String email;
  final String alias;
  final String password;
  final String confirmPassword;
  final String referalCode;

  SignUpModel({
    required this.uuid,
    required this.email,
    required this.alias,
    required this.password,
    required this.confirmPassword,
    required this.referalCode,
  });

  SignUpModel copyWith({
    String? uuid,
    String? email,
    String? alias,
    String? password,
    String? confirmPassword,
    String? referalCode,
  }) =>
      SignUpModel(
        uuid: uuid ?? this.uuid,
        email: email ?? this.email,
        alias: alias ?? this.alias,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        referalCode: referalCode ?? this.referalCode,
      );

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        uuid: json["uuid"],
        email: json["email"],
        alias: json["alias"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        referalCode: json["referal_code"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "email": email,
        "alias": alias,
        "password": password,
        "confirm_password": confirmPassword,
        "referal_code": referalCode,
      };

  factory SignUpModel.entityToModel({required SignUpEntity entity}) {
    return SignUpModel(
      uuid: entity.uuid,
      email: entity.email,
      alias: entity.alias,
      password: entity.password,
      confirmPassword: entity.confirmPassword,
      referalCode: entity.referalCode,
    );
  }
}
