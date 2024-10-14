class BannerResponseDbModel {
  final bool success;
  final List<BannerModel> data;

  BannerResponseDbModel({
    required this.success,
    required this.data,
  });

  BannerResponseDbModel copyWith({
    bool? success,
    List<BannerModel>? data,
  }) =>
      BannerResponseDbModel(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory BannerResponseDbModel.fromJson(Map<String, dynamic> json) =>
      BannerResponseDbModel(
        success: json["success"],
        data: List<BannerModel>.from(
            json["data"].map((x) => BannerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BannerModel {
  final int id;
  final String titulo;
  final String imagen1;

  BannerModel({
    required this.id,
    required this.titulo,
    required this.imagen1,
  });

  BannerModel copyWith({
    int? id,
    String? titulo,
    String? imagen1,
  }) =>
      BannerModel(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        imagen1: imagen1 ?? this.imagen1,
      );

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        titulo: json["titulo"],
        imagen1: json["imagen1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "imagen1": imagen1,
      };
}
