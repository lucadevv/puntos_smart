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
  final String imagen;

  BannerModel({
    required this.id,
    required this.titulo,
    required this.imagen,
  });

  BannerModel copyWith({
    int? id,
    String? titulo,
    String? imagen,
  }) =>
      BannerModel(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        imagen: imagen ?? this.imagen,
      );

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        titulo: json["titulo"],
        imagen: json["imagen"] ?? json["imagen1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "imagen": imagen,
      };
}
