class SignInResponseModel {
  final String accessToken;
  final String uuid;
  final String tokenType;
  final int expiresIn;

  SignInResponseModel({
    required this.accessToken,
    required this.uuid,
    required this.tokenType,
    required this.expiresIn,
  });

  SignInResponseModel copyWith({
    String? accessToken,
    String? uuid,
    String? tokenType,
    int? expiresIn,
  }) =>
      SignInResponseModel(
        accessToken: accessToken ?? this.accessToken,
        uuid: uuid ?? this.uuid,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
      );

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        accessToken: json["access_token"],
        uuid: json["uuid"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "uuid": uuid,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
