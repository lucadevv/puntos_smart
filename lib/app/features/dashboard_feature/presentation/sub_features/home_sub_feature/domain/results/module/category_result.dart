import '../../entities/response/module/category_response_entity.dart';

abstract class CategoryResult {}

class CategorySuccess implements CategoryResult {
  final List<CategoryResponseEntity> listCategories;

  CategorySuccess({required this.listCategories});
}

class CategoryFailure implements CategoryResult {
  final CategoryFailureStatus categoryFailureStatus;

  CategoryFailure({required this.categoryFailureStatus});
}

enum CategoryFailureStatus {
  network,
  notFound,
  server,
  unknown,
}
