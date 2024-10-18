import 'package:latlong2/latlong.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/flash_promotions_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module/survey_result.dart';

import '../results/module/category_result.dart';
import '../results/module/geo_promotions_result.dart';

abstract class ModuleRepository {
  Future<GeoPromotionsResult> getAllGeoPromotions({required LatLng latLng});
  Future<CategoryResult> getAllCategories({required int idModule});
  Future<FlashPromotionsResult> getAllFlashPromotions({required LatLng latLng});
  Future<SurveyResult> getAllSurveys({required LatLng latLng});
}
