class CategoryResponseModel {
  final int id;
  final String descripcion;
  final String imagen;
  final int category;

  CategoryResponseModel({
    required this.id,
    required this.descripcion,
    required this.imagen,
    required this.category,
  });

  CategoryResponseModel copyWith({
    int? id,
    String? descripcion,
    String? imagen,
    int? category,
  }) =>
      CategoryResponseModel(
        id: id ?? this.id,
        descripcion: descripcion ?? this.descripcion,
        imagen: imagen ?? this.imagen,
        category: category ?? this.category,
      );

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryResponseModel(
        id: json["id"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "imagen": imagen,
        "category": category,
      };
}
