class VerifyCodeOtpModel {
  final String status;
  final String phone;
  final String otpcode;
  final int password;
  final String uuid;
  final String message;

  VerifyCodeOtpModel({
    required this.status,
    required this.phone,
    required this.otpcode,
    required this.password,
    required this.uuid,
    required this.message,
  });

  VerifyCodeOtpModel copyWith({
    String? status,
    String? phone,
    String? otpcode,
    int? password,
    String? uuid,
    String? message,
  }) =>
      VerifyCodeOtpModel(
        status: status ?? this.status,
        phone: phone ?? this.phone,
        otpcode: otpcode ?? this.otpcode,
        password: password ?? this.password,
        uuid: uuid ?? this.uuid,
        message: message ?? this.message,
      );

  factory VerifyCodeOtpModel.fromJson(Map<String, dynamic> json) =>
      VerifyCodeOtpModel(
        status: json["status"],
        phone: json["phone"],
        otpcode: json["otpcode"],
        password: json["password"],
        uuid: json["uuid"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "phone": phone,
        "otpcode": otpcode,
        "password": password,
        "uuid": uuid,
        "message": message,
      };
}
