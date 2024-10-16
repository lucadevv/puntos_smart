import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/data/datasource/home_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/banner_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/featured_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module_no_login_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/news_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/repository/home_repository.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/banner_results.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/featured_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module_no_login_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/news_result.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasourceNtw _homeDatasourceNtw;
  HomeRepositoryImpl({required HomeDatasourceNtw homeDatasourceNtw})
      : _homeDatasourceNtw = homeDatasourceNtw;
  @override
  Future<BannerResults> getAllBanners() async {
    try {
      final response = await _homeDatasourceNtw.getAllBanners();

      final bannerList =
          BannerEntity.listModelToEntityModel(listModel: response.data);
      return BannerSuccess(bannerList: bannerList);
    } catch (e) {
      if (e is DioException) {
        return BannerFailure(bannerFailureStatus: BannerFailureStatus.network);
      } else {
        return BannerFailure(bannerFailureStatus: BannerFailureStatus.unknown);
      }
    }
  }

  @override
  Future<ModuleNoLoginResult> getAllModules() async {
    try {
      final response = await _homeDatasourceNtw.getAllModulesNoLogin();

      final bannerList =
          BannerEntity.listModelToEntityModel(listModel: response.data);
      return ModuleNoLoginSuccess(
          moduleNoLoginEntity:
              ModuleNoLoginEntity.listModelToListEntity(list: bannerList));
    } catch (e) {
      if (e is DioException) {
        return ModuleNoLoginFailure(
            moduleNoLoginFailureStatus: ModuleNoLoginFailureStatus.network);
      } else {
        return ModuleNoLoginFailure(
            moduleNoLoginFailureStatus: ModuleNoLoginFailureStatus.unknown);
      }
    }
  }

  @override
  Future<NewsResult> getAllNews() async {
    try {
      final response = await _homeDatasourceNtw.getAllNews();
      final listDatum = response.data;

      return NewsSuccess(
          newsList: NewsEntity.listModelToListEntity(list: listDatum));
    } catch (e) {
      if (e is DioException) {
        return NewsFauilure(newsFauilureStatus: NewsFauilureStatus.notFound);
      } else {
        return NewsFauilure(newsFauilureStatus: NewsFauilureStatus.unknown);
      }
    }
  }

  @override
  Future<FeaturedResult> getAllFutures() async {
    try {
      final response = await _homeDatasourceNtw.getAllFeatured();
      final featuredList = response.data;
      return FeaturedSuccess(
          featuredList:
              FeaturedEntity.listModelToListEntity(list: featuredList));
    } catch (e) {
      if (e is DioException) {
        return FeaturedFailure(
            featuredFailureStatus: FeaturedFailureStatus.notFound);
      } else {
        return FeaturedFailure(
            featuredFailureStatus: FeaturedFailureStatus.unknown);
      }
    }
  }
}
