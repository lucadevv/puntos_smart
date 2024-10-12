import 'package:puntos_smart_user/app/features/auth_feature/data/models/response/verify_number_model.dart';

class VerifyNumberEntity {
  final String message;
  final DataEntity data;

  VerifyNumberEntity({
    required this.message,
    required this.data,
  });

  VerifyNumberEntity copyWith({
    String? message,
    DataEntity? data,
  }) =>
      VerifyNumberEntity(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory VerifyNumberEntity.fromJson(Map<String, dynamic> json) =>
      VerifyNumberEntity(
        message: json["message"],
        data: DataEntity.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
  factory VerifyNumberEntity.modelToEntity({required VerifyNumberModel model}) {
    return VerifyNumberEntity(
      message: model.message,
      data: DataEntity.modelToEntiy(model: model.data),
    );
  }
  factory VerifyNumberEntity.empty() {
    return VerifyNumberEntity(
      message: "",
      data: DataEntity.empty(),
    );
  }
}

class DataEntity {
  final String phone;
  final String status;
  final int otpcode;
  final DateTime createdAt;

  DataEntity({
    required this.phone,
    required this.status,
    required this.otpcode,
    required this.createdAt,
  });

  DataEntity copyWith({
    String? phone,
    String? status,
    int? otpcode,
    DateTime? createdAt,
  }) =>
      DataEntity(
        phone: phone ?? this.phone,
        status: status ?? this.status,
        otpcode: otpcode ?? this.otpcode,
        createdAt: createdAt ?? this.createdAt,
      );

  factory DataEntity.fromJson(Map<String, dynamic> json) => DataEntity(
        phone: json["phone"],
        status: json["status"],
        otpcode: json["otpcode"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "status": status,
        "otpcode": otpcode,
        "created_at": createdAt.toIso8601String(),
      };

  factory DataEntity.modelToEntiy({required DataModel model}) => DataEntity(
        phone: model.phone,
        status: model.status,
        otpcode: model.otpcode,
        createdAt: model.createdAt,
      );
  factory DataEntity.empty() {
    return DataEntity(
      phone: "",
      status: "",
      otpcode: -1,
      createdAt: DateTime.now(),
    );
  }
}
