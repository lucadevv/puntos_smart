import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/banner_results.dart';

abstract class HomeRepository {
  Future<BannerResults> getAllBanners();
}
