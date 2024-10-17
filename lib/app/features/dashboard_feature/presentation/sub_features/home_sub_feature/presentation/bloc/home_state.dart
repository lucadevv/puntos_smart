part of 'home_bloc.dart';

class HomeState extends Equatable {
  final BannersStatus bannersStatus;
  final List<BannerEntity> bannerList;
  final ModuleNoLoginStatus moduleNoLoginStatus;
  final List<ModuleNoLoginEntity> moduleNoLoginList;
  final NewsStatus newsStatus;
  final List<NewsEntity> newsList;
  final FeaturedStatus featuredStatus;
  final List<FeaturedEntity> featuredList;

  const HomeState({
    required this.bannersStatus,
    required this.bannerList,
    required this.moduleNoLoginList,
    required this.moduleNoLoginStatus,
    required this.newsList,
    required this.newsStatus,
    required this.featuredStatus,
    required this.featuredList,
  });

  HomeState copyWith({
    BannersStatus? bannersStatus,
    List<BannerEntity>? bannerList,
    ModuleNoLoginStatus? moduleNoLoginStatus,
    List<ModuleNoLoginEntity>? moduleNoLoginList,
    NewsStatus? newsStatus,
    List<NewsEntity>? newsList,
    FeaturedStatus? featuredStatus,
    List<FeaturedEntity>? featuredList,
  }) =>
      HomeState(
        bannersStatus: bannersStatus ?? this.bannersStatus,
        bannerList: bannerList ?? this.bannerList,
        moduleNoLoginList: moduleNoLoginList ?? this.moduleNoLoginList,
        moduleNoLoginStatus: moduleNoLoginStatus ?? this.moduleNoLoginStatus,
        newsStatus: newsStatus ?? this.newsStatus,
        newsList: newsList ?? this.newsList,
        featuredStatus: featuredStatus ?? this.featuredStatus,
        featuredList: featuredList ?? this.featuredList,
      );

  factory HomeState.inital() => const HomeState(
        bannersStatus: BannersStatus.inital,
        bannerList: [],
        moduleNoLoginList: [],
        moduleNoLoginStatus: ModuleNoLoginStatus.inital,
        newsList: [],
        newsStatus: NewsStatus.inital,
        featuredStatus: FeaturedStatus.inital,
        featuredList: [],
      );
  @override
  List<Object> get props => [
        bannersStatus,
        bannerList,
        moduleNoLoginList,
        newsList,
        newsStatus,
        featuredStatus,
        featuredList
      ];
}

enum BannersStatus {
  inital,
  loading,
  success,
  notFound,
  network,
  server,
  unknown,
}

enum ModuleNoLoginStatus {
  inital,
  loading,
  success,
  notFound,
  network,
  server,
  unknown,
}

enum NewsStatus {
  inital,
  loading,
  success,
  notFound,
  network,
  server,
  unknown,
}

enum FeaturedStatus {
  inital,
  loading,
  success,
  notFound,
  network,
  server,
  unknown,
}
