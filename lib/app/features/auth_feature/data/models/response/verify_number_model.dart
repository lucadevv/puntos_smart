class VerifyNumberModel {
  final String message;
  final DataModel data;

  VerifyNumberModel({
    required this.message,
    required this.data,
  });

  VerifyNumberModel copyWith({
    String? message,
    DataModel? data,
  }) =>
      VerifyNumberModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory VerifyNumberModel.fromJson(Map<String, dynamic> json) =>
      VerifyNumberModel(
        message: json["message"],
        data: DataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class DataModel {
  final String phone;
  final String status;
  final int otpcode;
  final DateTime createdAt;

  DataModel({
    required this.phone,
    required this.status,
    required this.otpcode,
    required this.createdAt,
  });

  DataModel copyWith({
    String? phone,
    String? status,
    int? otpcode,
    DateTime? createdAt,
  }) =>
      DataModel(
        phone: phone ?? this.phone,
        status: status ?? this.status,
        otpcode: otpcode ?? this.otpcode,
        createdAt: createdAt ?? this.createdAt,
      );

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
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
}
