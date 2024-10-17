class ForgoutVerifyNumberModel {
  final String status;
  final String phone;
  final int otpcode;
  final String message;

  ForgoutVerifyNumberModel({
    required this.status,
    required this.phone,
    required this.otpcode,
    required this.message,
  });

  ForgoutVerifyNumberModel copyWith({
    String? status,
    String? phone,
    int? otpcode,
    String? message,
  }) =>
      ForgoutVerifyNumberModel(
        status: status ?? this.status,
        phone: phone ?? this.phone,
        otpcode: otpcode ?? this.otpcode,
        message: message ?? this.message,
      );

  factory ForgoutVerifyNumberModel.fromJson(Map<String, dynamic> json) =>
      ForgoutVerifyNumberModel(
        status: json["status"],
        phone: json["phone"],
        otpcode: json["otpcode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "phone": phone,
        "otpcode": otpcode,
        "message": message,
      };
}
