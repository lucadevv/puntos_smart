class SendNumberResponseModel {
  final String? status;
  final String? message;

  SendNumberResponseModel({
    this.status,
    this.message,
  });

  SendNumberResponseModel copyWith({
    String? status,
    String? message,
  }) =>
      SendNumberResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory SendNumberResponseModel.fromJson(Map<String, dynamic> json) =>
      SendNumberResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
