import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/model/response/home/banner_response_db_model.dart';

class BannerEntity {
  final int id;
  final String titulo;
  final String imagen1;

  BannerEntity({
    required this.id,
    required this.titulo,
    required this.imagen1,
  });

  BannerEntity copyWith({
    int? id,
    String? titulo,
    String? imagen1,
  }) =>
      BannerEntity(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        imagen1: imagen1 ?? this.imagen1,
      );

  factory BannerEntity.fromJson(Map<String, dynamic> json) => BannerEntity(
        id: json["id"],
        titulo: json["titulo"],
        imagen1: json["imagen1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "imagen1": imagen1,
      };

  factory BannerEntity.modelToEntity({required BannerModel model}) =>
      BannerEntity(
        id: model.id,
        titulo: model.titulo,
        imagen1: model.imagen,
      );

  static List<BannerEntity> listModelToEntityModel(
      {required List<BannerModel> listModel}) {
    return listModel
        .map((model) => BannerEntity.modelToEntity(model: model))
        .toList();
  }
}

final listBannerEntity = [
  BannerEntity(id: 0, titulo: "banner 1", imagen1: "assets/images/1.png"),
  BannerEntity(id: 1, titulo: "banner 2", imagen1: "assets/images/2.png")
];
