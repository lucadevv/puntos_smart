import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/banner_entity.dart';

class ModuleNoLoginEntity {
  final int id;
  final String titulo;
  final String imagen1;

  ModuleNoLoginEntity({
    required this.id,
    required this.titulo,
    required this.imagen1,
  });

  ModuleNoLoginEntity copyWith({
    int? id,
    String? titulo,
    String? imagen1,
  }) =>
      ModuleNoLoginEntity(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        imagen1: imagen1 ?? this.imagen1,
      );

  factory ModuleNoLoginEntity.fromJson(Map<String, dynamic> json) =>
      ModuleNoLoginEntity(
        id: json["id"],
        titulo: json["titulo"],
        imagen1: json["imagen1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "imagen1": imagen1,
      };
  factory ModuleNoLoginEntity.modelToEntity({required BannerEntity entity}) {
    return ModuleNoLoginEntity(
      id: entity.id,
      titulo: entity.titulo,
      imagen1: entity.imagen1,
    );
  }

  static List<ModuleNoLoginEntity> listModelToListEntity(
      {required List<BannerEntity> list}) {
    return list
        .map((model) => ModuleNoLoginEntity.modelToEntity(entity: model))
        .toList();
  }
}
