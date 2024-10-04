class SendCodeRequestEntity {
  final String number;
  final String code;

  SendCodeRequestEntity({
    required this.number,
    required this.code,
  });

  SendCodeRequestEntity copyWith({
    String? number,
    String? code,
  }) =>
      SendCodeRequestEntity(
        number: number ?? this.number,
        code: code ?? this.code,
      );

  factory SendCodeRequestEntity.fromJson(Map<String, dynamic> json) =>
      SendCodeRequestEntity(
        number: json["number"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "code": code,
      };
}
