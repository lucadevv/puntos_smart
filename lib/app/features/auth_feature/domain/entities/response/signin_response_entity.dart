// To parse this JSON data, do
//
//     final signInResponseEntity = signInResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/signin_response_model.dart';

SignInResponseEntity signInResponseEntityFromJson(String str) =>
    SignInResponseEntity.fromJson(json.decode(str));

String signInResponseEntityToJson(SignInResponseEntity data) =>
    json.encode(data.toJson());

class SignInResponseEntity {
  final String accessToken;
  final String uuid;

  SignInResponseEntity({
    required this.accessToken,
    required this.uuid,
  });

  SignInResponseEntity copyWith({
    String? accessToken,
    String? uuid,
  }) =>
      SignInResponseEntity(
        accessToken: accessToken ?? this.accessToken,
        uuid: uuid ?? this.uuid,
      );

  factory SignInResponseEntity.fromJson(Map<String, dynamic> json) =>
      SignInResponseEntity(
        accessToken: json["access_token"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "uuid": uuid,
      };

  factory SignInResponseEntity.modelToEntity(
          {required SignInResponseModel model}) =>
      SignInResponseEntity(
        accessToken: model.accessToken,
        uuid: model.uuid,
      );
}
