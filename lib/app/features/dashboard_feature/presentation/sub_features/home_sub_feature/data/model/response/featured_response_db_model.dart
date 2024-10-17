class FutureResponsedDbModel {
  final bool success;
  final List<Datum> data;

  FutureResponsedDbModel({
    required this.success,
    required this.data,
  });

  FutureResponsedDbModel copyWith({
    bool? success,
    List<Datum>? data,
  }) =>
      FutureResponsedDbModel(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory FutureResponsedDbModel.fromJson(Map<String, dynamic> json) =>
      FutureResponsedDbModel(
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
  final String imagen1;
  final String descripcionCorta;
  final String precio;

  Datum({
    required this.id,
    required this.titulo,
    required this.imagen1,
    required this.descripcionCorta,
    required this.precio,
  });

  Datum copyWith({
    int? id,
    String? titulo,
    String? imagen1,
    String? descripcionCorta,
    String? precio,
  }) =>
      Datum(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        imagen1: imagen1 ?? this.imagen1,
        descripcionCorta: descripcionCorta ?? this.descripcionCorta,
        precio: precio ?? this.precio,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
}
