import '../../../data/model/response/news_response_db_model.dart';

class NewsEntity {
  final int id;
  final String titulo;
  final String notaCorta;
  final String descripcion;
  final String imagen1;
  final String imagen2;

  NewsEntity({
    required this.id,
    required this.titulo,
    required this.notaCorta,
    required this.descripcion,
    required this.imagen1,
    required this.imagen2,
  });

  NewsEntity copyWith({
    int? id,
    String? titulo,
    String? notaCorta,
    String? descripcion,
    String? imagen1,
    String? imagen2,
  }) =>
      NewsEntity(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        notaCorta: notaCorta ?? this.notaCorta,
        descripcion: descripcion ?? this.descripcion,
        imagen1: imagen1 ?? this.imagen1,
        imagen2: imagen2 ?? this.imagen2,
      );

  factory NewsEntity.fromJson(Map<String, dynamic> json) => NewsEntity(
        id: json["id"],
        titulo: json["titulo"],
        notaCorta: json["nota_corta"],
        descripcion: json["descripcion"],
        imagen1: json["imagen1"],
        imagen2: json["imagen2"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "nota_corta": notaCorta,
        "descripcion": descripcion,
        "imagen1": imagen1,
        "imagen2": imagen2,
      };

  factory NewsEntity.modelToEntity({required Datum model}) => NewsEntity(
        id: model.id,
        titulo: model.titulo,
        notaCorta: model.notaCorta,
        descripcion: model.descripcion,
        imagen1: model.imagen1,
        imagen2: model.imagen2,
      );
  static List<NewsEntity> listModelToListEntity({required List<Datum> list}) =>
      list.map((model) => NewsEntity.modelToEntity(model: model)).toList();
}
