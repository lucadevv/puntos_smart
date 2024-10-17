import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/banner_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module_no_login_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/repository/home_repository.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/banner_results.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/featured_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module_no_login_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/news_result.dart';

import '../../../domain/entities/response/featured_entity.dart';
import '../../../domain/entities/response/news_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(HomeState.inital()) {
    on<GetAllBannersEvent>(_getAllBannersEvent);
    on<GetAllModuleNoLoginEvent>(_getAllModuleNoLoginEvent);
    on<GetAllNewsEvent>(_getAllNewsEvent);
    on<GetAllFeaturedEvent>(_getAllFeaturedEvent);
  }

  Future<void> _getAllBannersEvent(
      GetAllBannersEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(bannersStatus: BannersStatus.loading));
    try {
      final response = await _homeRepository.getAllBanners();
      if (response is BannerSuccess) {
        await Future.delayed(const Duration(seconds: 4));
        emit(state.copyWith(
          bannerList: response.bannerList,
          bannersStatus: BannersStatus.success,
        ));
      } else if (response is BannerFailure) {
        switch (response.bannerFailureStatus) {
          case BannerFailureStatus.notFound:
            emit(state.copyWith(bannersStatus: BannersStatus.notFound));
            break;
          case BannerFailureStatus.server:
            emit(state.copyWith(bannersStatus: BannersStatus.server));
            break;
          case BannerFailureStatus.network:
            emit(state.copyWith(bannersStatus: BannersStatus.network));
            break;

          default:
        }
      }
    } catch (e) {
      emit(state.copyWith(bannersStatus: BannersStatus.unknown));
    }
  }

  Future<void> _getAllModuleNoLoginEvent(
      GetAllModuleNoLoginEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(moduleNoLoginStatus: ModuleNoLoginStatus.loading));

    try {
      final response = await _homeRepository.getAllModules();

      if (response is ModuleNoLoginSuccess) {
        await Future.delayed(const Duration(seconds: 4));
        emit(state.copyWith(
          moduleNoLoginList: response.moduleNoLoginEntity,
          moduleNoLoginStatus: ModuleNoLoginStatus.success,
        ));
      } else if (response is ModuleNoLoginFailure) {
        switch (response.moduleNoLoginFailureStatus) {
          case ModuleNoLoginFailureStatus.notFound:
            emit(state.copyWith(
                moduleNoLoginStatus: ModuleNoLoginStatus.notFound));
            break;
          case ModuleNoLoginFailureStatus.server:
            emit(state.copyWith(
                moduleNoLoginStatus: ModuleNoLoginStatus.server));
            break;
          case ModuleNoLoginFailureStatus.network:
            emit(state.copyWith(
                moduleNoLoginStatus: ModuleNoLoginStatus.network));
            break;

          default:
        }
      }
    } catch (e) {
      emit(state.copyWith(moduleNoLoginStatus: ModuleNoLoginStatus.unknown));
    }
  }

  Future<void> _getAllNewsEvent(
      GetAllNewsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(newsStatus: NewsStatus.loading));

    try {
      final response = await _homeRepository.getAllNews();

      if (response is NewsSuccess) {
        await Future.delayed(const Duration(seconds: 4));
        emit(state.copyWith(
          newsList: response.newsList,
          newsStatus: NewsStatus.success,
        ));
      } else if (response is NewsFauilure) {
        emit(state.copyWith(newsStatus: NewsStatus.notFound));
      }
    } catch (e) {
      emit(state.copyWith(newsStatus: NewsStatus.unknown));
    }
  }

  Future<void> _getAllFeaturedEvent(
      GetAllFeaturedEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(featuredStatus: FeaturedStatus.loading));
    try {
      final response = await _homeRepository.getAllFutures();

      if (response is FeaturedSuccess) {
        await Future.delayed(const Duration(seconds: 4));
        emit(state.copyWith(
          featuredList: response.featuredList,
          featuredStatus: FeaturedStatus.success,
        ));
      } else if (response is NewsFauilure) {
        emit(state.copyWith(featuredStatus: FeaturedStatus.notFound));
      }
    } catch (e) {
      emit(state.copyWith(featuredStatus: FeaturedStatus.unknown));
    }
  }
}
