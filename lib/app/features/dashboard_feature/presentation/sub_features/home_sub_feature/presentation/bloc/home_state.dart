part of 'home_bloc.dart';

class HomeState extends Equatable {
  final BannersStatus bannersStatus;
  final List<BannerEntity> bannerList;
  final ModuleNoLoginStatus moduleNoLoginStatus;
  final List<ModuleNoLoginEntity> moduleNoLoginList;
  const HomeState({
    required this.bannersStatus,
    required this.bannerList,
    required this.moduleNoLoginList,
    required this.moduleNoLoginStatus,
  });

  HomeState copyWith({
    BannersStatus? bannersStatus,
    List<BannerEntity>? bannerList,
    ModuleNoLoginStatus? moduleNoLoginStatus,
    List<ModuleNoLoginEntity>? moduleNoLoginList,
  }) =>
      HomeState(
        bannersStatus: bannersStatus ?? this.bannersStatus,
        bannerList: bannerList ?? this.bannerList,
        moduleNoLoginList: moduleNoLoginList ?? this.moduleNoLoginList,
        moduleNoLoginStatus: moduleNoLoginStatus ?? this.moduleNoLoginStatus,
      );

  factory HomeState.inital() => const HomeState(
        bannersStatus: BannersStatus.inital,
        bannerList: [],
        moduleNoLoginList: [],
        moduleNoLoginStatus: ModuleNoLoginStatus.inital,
      );
  @override
  List<Object> get props => [bannersStatus, bannerList, moduleNoLoginList];
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
