class UpdatePasswordEntity {
  final String uuid;
  final String password;
  final String confirmPassword;

  UpdatePasswordEntity({
    required this.uuid,
    required this.password,
    required this.confirmPassword,
  });

  UpdatePasswordEntity copyWith({
    String? uuid,
    String? password,
    String? confirmPassword,
  }) =>
      UpdatePasswordEntity(
        uuid: uuid ?? this.uuid,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
      );

  factory UpdatePasswordEntity.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordEntity(
        uuid: json["uuid"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "password": password,
        "confirm_password": confirmPassword,
      };
}
