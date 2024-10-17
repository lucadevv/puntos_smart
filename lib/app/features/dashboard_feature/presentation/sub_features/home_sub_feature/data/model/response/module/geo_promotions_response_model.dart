class GeoPromotionsResponseDbModel {
  final String nombreComercial;
  final String direccion;
  final String latitud;
  final String longitud;
  final int productId;
  final String titulo;
  final String descripcionCorta;
  final String descripcion;
  final String precio;
  final String precioSinOferta;
  final int likes;
  final String imagen1;
  final double distance;

  GeoPromotionsResponseDbModel({
    required this.nombreComercial,
    required this.direccion,
    required this.latitud,
    required this.longitud,
    required this.productId,
    required this.titulo,
    required this.descripcionCorta,
    required this.descripcion,
    required this.precio,
    required this.precioSinOferta,
    required this.likes,
    required this.imagen1,
    required this.distance,
  });

  GeoPromotionsResponseDbModel copyWith({
    String? nombreComercial,
    String? direccion,
    String? latitud,
    String? longitud,
    int? productId,
    String? titulo,
    String? descripcionCorta,
    String? descripcion,
    String? precio,
    String? precioSinOferta,
    int? likes,
    String? imagen1,
    double? distance,
  }) =>
      GeoPromotionsResponseDbModel(
        nombreComercial: nombreComercial ?? this.nombreComercial,
        direccion: direccion ?? this.direccion,
        latitud: latitud ?? this.latitud,
        longitud: longitud ?? this.longitud,
        productId: productId ?? this.productId,
        titulo: titulo ?? this.titulo,
        descripcionCorta: descripcionCorta ?? this.descripcionCorta,
        descripcion: descripcion ?? this.descripcion,
        precio: precio ?? this.precio,
        precioSinOferta: precioSinOferta ?? this.precioSinOferta,
        likes: likes ?? this.likes,
        imagen1: imagen1 ?? this.imagen1,
        distance: distance ?? this.distance,
      );

  factory GeoPromotionsResponseDbModel.fromJson(Map<String, dynamic> json) =>
      GeoPromotionsResponseDbModel(
        nombreComercial: json["nombre_comercial"],
        direccion: json["direccion"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        productId: json["product_id"],
        titulo: json["titulo"],
        descripcionCorta: json["descripcion_corta"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        precioSinOferta: json["precio_sin_oferta"],
        likes: json["likes"],
        imagen1: json["imagen1"],
        distance: json["distance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "nombre_comercial": nombreComercial,
        "direccion": direccion,
        "latitud": latitud,
        "longitud": longitud,
        "product_id": productId,
        "titulo": titulo,
        "descripcion_corta": descripcionCorta,
        "descripcion": descripcion,
        "precio": precio,
        "precio_sin_oferta": precioSinOferta,
        "likes": likes,
        "imagen1": imagen1,
        "distance": distance,
      };
}
