import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/model/response/module/surver_response_model.dart';

class SurveryResponseEntity {
  final int id;
  final String titulo;
  final String descripcion;
  final String imagen;
  final int puntos;
  final double distance;

  SurveryResponseEntity({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    required this.puntos,
    required this.distance,
  });

  SurveryResponseEntity copyWith({
    int? id,
    String? titulo,
    String? descripcion,
    String? imagen,
    int? puntos,
    double? distance,
  }) =>
      SurveryResponseEntity(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        descripcion: descripcion ?? this.descripcion,
        imagen: imagen ?? this.imagen,
        puntos: puntos ?? this.puntos,
        distance: distance ?? this.distance,
      );

  factory SurveryResponseEntity.fromJson(Map<String, dynamic> json) =>
      SurveryResponseEntity(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        puntos: json["puntos"],
        distance: json["distance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "imagen": imagen,
        "puntos": puntos,
        "distance": distance,
      };
  factory SurveryResponseEntity.modelToEntity(
          {required SurveryResponseModel model}) =>
      SurveryResponseEntity(
        id: model.id,
        titulo: model.titulo,
        descripcion: model.descripcion,
        imagen: model.imagen,
        puntos: model.puntos,
        distance: model.distance,
      );
  static List<SurveryResponseEntity> listModelToListEntity(
          {required List<SurveryResponseModel> list}) =>
      list
          .map((model) => SurveryResponseEntity.modelToEntity(model: model))
          .toList();
}
