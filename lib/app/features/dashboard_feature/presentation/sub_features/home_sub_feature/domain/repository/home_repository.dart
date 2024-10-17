import 'package:latlong2/latlong.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/banner_results.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module_no_login_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/news_result.dart';

import '../results/featured_result.dart';
import '../results/geo_promotions_result.dart';

abstract class HomeRepository {
  Future<BannerResults> getAllBanners();
  Future<ModuleNoLoginResult> getAllModules();
  Future<NewsResult> getAllNews();
  Future<FeaturedResult> getAllFutures();
  Future<GeoPromotionsResult> getAllGeoPromotions({required LatLng latLng});
}
