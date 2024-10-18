import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/home/news_entity.dart';

abstract class NewsResult {}

class NewsSuccess implements NewsResult {
  final List<NewsEntity> newsList;

  NewsSuccess({required this.newsList});
}

class NewsFauilure implements NewsResult {
  final NewsFauilureStatus newsFauilureStatus;

  NewsFauilure({required this.newsFauilureStatus});
}

enum NewsFauilureStatus {
  network,
  notFound,
  server,
  unknown,
}
