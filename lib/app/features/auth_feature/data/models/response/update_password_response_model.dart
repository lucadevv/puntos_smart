class UpdatePasswordResponseModel {
  final String message;
  final String status;
  final String uuid;

  UpdatePasswordResponseModel({
    required this.message,
    required this.status,
    required this.uuid,
  });

  UpdatePasswordResponseModel copyWith({
    String? message,
    String? status,
    String? uuid,
  }) =>
      UpdatePasswordResponseModel(
        message: message ?? this.message,
        status: status ?? this.status,
        uuid: uuid ?? this.uuid,
      );

  factory UpdatePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordResponseModel(
        message: json["message"],
        status: json["status"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "uuid": uuid,
      };
}
