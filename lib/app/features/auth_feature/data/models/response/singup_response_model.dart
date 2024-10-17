// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'dart:convert';

SignUpResponseModel signUpResponseModelFromJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) =>
    json.encode(data.toJson());

class SignUpResponseModel {
  final String message;
  final String status;
  final String uuid;

  SignUpResponseModel({
    required this.message,
    required this.status,
    required this.uuid,
  });

  SignUpResponseModel copyWith({
    String? message,
    String? status,
    String? uuid,
  }) =>
      SignUpResponseModel(
        message: message ?? this.message,
        status: status ?? this.status,
        uuid: uuid ?? this.uuid,
      );

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        message: json["message"],
        status: json["status"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "uuid": uuid,
      };
}
