part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAllBannersEvent extends HomeEvent {}

class GetAllModuleNoLoginEvent extends HomeEvent {}

class GetAllNewsEvent extends HomeEvent {}

class GetAllFeaturedEvent extends HomeEvent {}
