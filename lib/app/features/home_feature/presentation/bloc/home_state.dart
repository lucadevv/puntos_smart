part of 'home_bloc.dart';

class HomeState extends Equatable {
  final BannersStatus bannersStatus;
  final List<BannerEntity> bannerList;
  const HomeState({
    required this.bannersStatus,
    required this.bannerList,
  });

  HomeState copyWith({
    BannersStatus? bannersStatus,
    List<BannerEntity>? bannerList,
  }) =>
      HomeState(
        bannersStatus: bannersStatus ?? this.bannersStatus,
        bannerList: bannerList ?? this.bannerList,
      );

  factory HomeState.inital() => const HomeState(
        bannersStatus: BannersStatus.inital,
        bannerList: [],
      );
  @override
  List<Object> get props => [bannersStatus, bannerList];
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
