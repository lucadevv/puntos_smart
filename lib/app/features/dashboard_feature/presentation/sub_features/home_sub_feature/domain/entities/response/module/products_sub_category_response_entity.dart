class ProductsSubCategoryResponseEntity {
  final int id;
  final String titulo;
  final String descripcionCorta;
  final String imagen1;
  final int likes;
  final String logo;

  ProductsSubCategoryResponseEntity({
    required this.id,
    required this.titulo,
    required this.descripcionCorta,
    required this.imagen1,
    required this.likes,
    required this.logo,
  });

  ProductsSubCategoryResponseEntity copyWith({
    int? id,
    String? titulo,
    String? descripcionCorta,
    String? imagen1,
    int? likes,
    String? logo,
  }) =>
      ProductsSubCategoryResponseEntity(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        descripcionCorta: descripcionCorta ?? this.descripcionCorta,
        imagen1: imagen1 ?? this.imagen1,
        likes: likes ?? this.likes,
        logo: logo ?? this.logo,
      );

  factory ProductsSubCategoryResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      ProductsSubCategoryResponseEntity(
        id: json["id"],
        titulo: json["titulo"],
        descripcionCorta: json["descripcion_corta"],
        imagen1: json["imagen1"],
        likes: json["likes"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descripcion_corta": descripcionCorta,
        "imagen1": imagen1,
        "likes": likes,
        "logo": logo,
      };
}
