class SignUpEntity {
  final String uuid;
  final String email;
  final String alias;
  final String password;
  final String confirmPassword;
  final String referalCode;

  SignUpEntity({
    required this.uuid,
    required this.email,
    required this.alias,
    required this.password,
    required this.confirmPassword,
    required this.referalCode,
  });

  SignUpEntity copyWith({
    String? uuid,
    String? email,
    String? alias,
    String? password,
    String? confirmPassword,
    String? referalCode,
  }) =>
      SignUpEntity(
        uuid: uuid ?? this.uuid,
        email: email ?? this.email,
        alias: alias ?? this.alias,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        referalCode: referalCode ?? this.referalCode,
      );

  factory SignUpEntity.fromJson(Map<String, dynamic> json) => SignUpEntity(
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
}
