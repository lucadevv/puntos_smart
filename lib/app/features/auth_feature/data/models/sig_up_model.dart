class SignUpModel {
  final String? name;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? password;
  final DateTime? birthday;
  final String? gender;
  final int? district;
  final String? signInMethod;
  final String? fcmToken;
  final String? location;

  SignUpModel({
    this.name,
    this.lastname,
    this.email,
    this.phone,
    this.password,
    this.birthday,
    this.gender,
    this.district,
    this.signInMethod,
    this.fcmToken,
    this.location,
  });

  SignUpModel copyWith({
    String? name,
    String? lastname,
    String? email,
    String? phone,
    String? password,
    DateTime? birthday,
    String? gender,
    int? district,
    String? signInMethod,
    String? fcmToken,
    String? location,
  }) =>
      SignUpModel(
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        birthday: birthday ?? this.birthday,
        gender: gender ?? this.gender,
        district: district ?? this.district,
        signInMethod: signInMethod ?? this.signInMethod,
        fcmToken: fcmToken ?? this.fcmToken,
        location: location ?? this.location,
      );

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        gender: json["gender"],
        district: json["district"],
        signInMethod: json["sign_in_method"],
        fcmToken: json["fcm_token"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "birthday": birthday?.toIso8601String(),
        "gender": gender,
        "district": district,
        "sign_in_method": signInMethod,
        "fcm_token": fcmToken,
        "location": location,
      };
}
