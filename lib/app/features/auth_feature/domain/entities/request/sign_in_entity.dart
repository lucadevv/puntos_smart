class SignInEntity {
  final String phone;
  final String password;

  SignInEntity({
    required this.phone,
    required this.password,
  });

  factory SignInEntity.empty() => SignInEntity(
        phone: '',
        password: '',
      );
}
