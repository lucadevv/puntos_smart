import '../../../../data/model/response/module/category_response_model.dart';

class CategoryResponseEntity {
  final int id;
  final String descripcion;
  final String imagen;
  final int category;

  CategoryResponseEntity({
    required this.id,
    required this.descripcion,
    required this.imagen,
    required this.category,
  });

  CategoryResponseEntity copyWith({
    int? id,
    String? descripcion,
    String? imagen,
    int? category,
  }) =>
      CategoryResponseEntity(
        id: id ?? this.id,
        descripcion: descripcion ?? this.descripcion,
        imagen: imagen ?? this.imagen,
        category: category ?? this.category,
      );

  factory CategoryResponseEntity.fromJson(Map<String, dynamic> json) =>
      CategoryResponseEntity(
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

  factory CategoryResponseEntity.modelToEntity(
          {required CategoryResponseModel model}) =>
      CategoryResponseEntity(
        id: model.id,
        descripcion: model.descripcion,
        imagen: model.imagen,
        category: model.category,
      );

  static List<CategoryResponseEntity> listModelToListEntity(
          {required List<CategoryResponseModel> listModel}) =>
      listModel
          .map((model) => CategoryResponseEntity.modelToEntity(model: model))
          .toList();
}
