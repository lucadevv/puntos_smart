import '../../../data/model/response/featured_response_db_model.dart';

class FeaturedEntity {
  final int id;
  final String titulo;
  final String imagen1;
  final String descripcionCorta;
  final String precio;

  FeaturedEntity({
    required this.id,
    required this.titulo,
    required this.imagen1,
    required this.descripcionCorta,
    required this.precio,
  });

  FeaturedEntity copyWith({
    int? id,
    String? titulo,
    String? imagen1,
    String? descripcionCorta,
    String? precio,
  }) =>
      FeaturedEntity(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        imagen1: imagen1 ?? this.imagen1,
        descripcionCorta: descripcionCorta ?? this.descripcionCorta,
        precio: precio ?? this.precio,
      );

  factory FeaturedEntity.fromJson(Map<String, dynamic> json) => FeaturedEntity(
        id: json["id"],
        titulo: json["titulo"],
        imagen1: json["imagen1"],
        descripcionCorta: json["descripcion_corta"],
        precio: json["precio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "imagen1": imagen1,
        "descripcion_corta": descripcionCorta,
        "precio": precio,
      };
  factory FeaturedEntity.modeltToEntity({required Datum model}) =>
      FeaturedEntity(
        id: model.id,
        titulo: model.titulo,
        imagen1: model.imagen1,
        descripcionCorta: model.descripcionCorta,
        precio: model.precio,
      );
  static List<FeaturedEntity> listModelToListEntity(
          {required List<Datum> list}) =>
      list.map((model) => FeaturedEntity.modeltToEntity(model: model)).toList();
}
