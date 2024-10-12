class SendCodeOtpEntity {
  final String phone;
  final String code;

  SendCodeOtpEntity({
    required this.phone,
    required this.code,
  });

  SendCodeOtpEntity copyWith({
    String? phone,
    String? code,
  }) =>
      SendCodeOtpEntity(
        phone: phone ?? this.phone,
        code: code ?? this.code,
      );

  factory SendCodeOtpEntity.fromJson(Map<String, dynamic> json) =>
      SendCodeOtpEntity(
        phone: json["phone"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "code": code,
      };
}
