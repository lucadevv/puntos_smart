class ProductsSubCategoryResponseModel {
  final int id;
  final String titulo;
  final String descripcionCorta;
  final String imagen1;
  final int likes;
  final String logo;

  ProductsSubCategoryResponseModel({
    required this.id,
    required this.titulo,
    required this.descripcionCorta,
    required this.imagen1,
    required this.likes,
    required this.logo,
  });

  ProductsSubCategoryResponseModel copyWith({
    int? id,
    String? titulo,
    String? descripcionCorta,
    String? imagen1,
    int? likes,
    String? logo,
  }) =>
      ProductsSubCategoryResponseModel(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        descripcionCorta: descripcionCorta ?? this.descripcionCorta,
        imagen1: imagen1 ?? this.imagen1,
        likes: likes ?? this.likes,
        logo: logo ?? this.logo,
      );

  factory ProductsSubCategoryResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ProductsSubCategoryResponseModel(
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
