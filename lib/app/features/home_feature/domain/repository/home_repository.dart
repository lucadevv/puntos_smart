import 'package:puntos_smart_user/app/features/home_feature/domain/results/banner_results.dart';

abstract class HomeRepository {
  Future<BannerResults> getAllBanners();
}
