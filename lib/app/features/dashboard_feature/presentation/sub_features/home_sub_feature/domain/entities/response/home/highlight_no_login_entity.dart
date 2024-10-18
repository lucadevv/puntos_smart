import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/home/banner_entity.dart';

class HighlightNoLoginEntity {
  final int id;
  final String titulo;
  final String imagen1;

  HighlightNoLoginEntity({
    required this.id,
    required this.titulo,
    required this.imagen1,
  });

  HighlightNoLoginEntity copyWith({
    int? id,
    String? titulo,
    String? imagen1,
  }) =>
      HighlightNoLoginEntity(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        imagen1: imagen1 ?? this.imagen1,
      );

  factory HighlightNoLoginEntity.fromJson(Map<String, dynamic> json) =>
      HighlightNoLoginEntity(
        id: json["id"],
        titulo: json["titulo"],
        imagen1: json["imagen1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "imagen1": imagen1,
      };
  factory HighlightNoLoginEntity.modelToEntity({required BannerEntity entity}) {
    return HighlightNoLoginEntity(
      id: entity.id,
      titulo: entity.titulo,
      imagen1: entity.imagen1,
    );
  }

  static List<HighlightNoLoginEntity> listModelToListEntity(
      {required List<BannerEntity> list}) {
    return list
        .map((model) => HighlightNoLoginEntity.modelToEntity(entity: model))
        .toList();
  }
}
