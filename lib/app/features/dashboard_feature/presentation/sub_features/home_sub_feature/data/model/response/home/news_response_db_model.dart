class NewsResponseDbModel {
  final bool success;
  final List<Datum> data;

  NewsResponseDbModel({
    required this.success,
    required this.data,
  });

  NewsResponseDbModel copyWith({
    bool? success,
    List<Datum>? data,
  }) =>
      NewsResponseDbModel(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory NewsResponseDbModel.fromJson(Map<String, dynamic> json) =>
      NewsResponseDbModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String titulo;
  final String notaCorta;
  final String descripcion;
  final String imagen1;
  final String imagen2;

  Datum({
    required this.id,
    required this.titulo,
    required this.notaCorta,
    required this.descripcion,
    required this.imagen1,
    required this.imagen2,
  });

  Datum copyWith({
    int? id,
    String? titulo,
    String? notaCorta,
    String? descripcion,
    String? imagen1,
    String? imagen2,
  }) =>
      Datum(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        notaCorta: notaCorta ?? this.notaCorta,
        descripcion: descripcion ?? this.descripcion,
        imagen1: imagen1 ?? this.imagen1,
        imagen2: imagen2 ?? this.imagen2,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
}
