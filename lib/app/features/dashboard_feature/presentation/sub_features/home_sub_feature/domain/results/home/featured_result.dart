import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/home/featured_entity.dart';

abstract class FeaturedResult {}

class FeaturedSuccess implements FeaturedResult {
  final List<FeaturedEntity> featuredList;

  FeaturedSuccess({required this.featuredList});
}

class FeaturedFailure implements FeaturedResult {
  final FeaturedFailureStatus featuredFailureStatus;

  FeaturedFailure({required this.featuredFailureStatus});
}

enum FeaturedFailureStatus {
  network,
  notFound,
  server,
  unknown,
}
