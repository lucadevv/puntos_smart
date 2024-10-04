class SendCodeResponseModel {
  final String status;
  final String message;

  SendCodeResponseModel({
    required this.status,
    required this.message,
  });

  SendCodeResponseModel copyWith({
    String? status,
    String? message,
  }) =>
      SendCodeResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory SendCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      SendCodeResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
