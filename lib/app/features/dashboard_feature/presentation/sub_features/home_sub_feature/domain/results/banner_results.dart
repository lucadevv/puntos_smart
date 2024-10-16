import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/banner_entity.dart';

abstract class BannerResults {}

class BannerSuccess extends BannerResults {
  final List<BannerEntity> bannerList;

  BannerSuccess({required this.bannerList});
}

class BannerFailure extends BannerResults {
  final BannerFailureStatus bannerFailureStatus;

  BannerFailure({required this.bannerFailureStatus});
}

enum BannerFailureStatus {
  network, // Error de red
  notFound, // Error 404 o similar
  server, // Error de servidor (500)
  unknown // Error desconocido
}
