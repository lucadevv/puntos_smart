class SignUpEntity {
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String password;

  SignUpEntity({
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
  });

  SignUpEntity copyWith({
    String? name,
    String? lastname,
    String? email,
    String? phone,
    String? password,
  }) =>
      SignUpEntity(
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );
}
