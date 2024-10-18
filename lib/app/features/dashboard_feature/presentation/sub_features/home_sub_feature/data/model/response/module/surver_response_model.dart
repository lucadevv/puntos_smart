class SurveryResponseModel {
  final int id;
  final String titulo;
  final String descripcion;
  final String imagen;
  final int puntos;
  final double distance;

  SurveryResponseModel({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    required this.puntos,
    required this.distance,
  });

  SurveryResponseModel copyWith({
    int? id,
    String? titulo,
    String? descripcion,
    String? imagen,
    int? puntos,
    double? distance,
  }) =>
      SurveryResponseModel(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        descripcion: descripcion ?? this.descripcion,
        imagen: imagen ?? this.imagen,
        puntos: puntos ?? this.puntos,
        distance: distance ?? this.distance,
      );

  factory SurveryResponseModel.fromJson(Map<String, dynamic> json) =>
      SurveryResponseModel(
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
}
