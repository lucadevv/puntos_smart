class SignInEntity {
  final String email;
  final String password;

  SignInEntity({
    required this.email,
    required this.password,
  });

  factory SignInEntity.empty() => SignInEntity(
        email: '',
        password: '',
      );
}
