import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module/geo_promotions_response_entity.dart';

abstract class GeoPromotionsResult {}

class GeoPromotionsSuccess implements GeoPromotionsResult {
  final List<GeoPromotionsResponseEntity> listGeoPromotiosns;

  GeoPromotionsSuccess({required this.listGeoPromotiosns});
}

class GeoPromotionsFailure implements GeoPromotionsResult {
  final GeoPromotionsFailureStatus geoPromotionsFailureStatus;

  GeoPromotionsFailure({required this.geoPromotionsFailureStatus});
}

enum GeoPromotionsFailureStatus {
  network,
  notFound,
  server,
  unknown,
}
