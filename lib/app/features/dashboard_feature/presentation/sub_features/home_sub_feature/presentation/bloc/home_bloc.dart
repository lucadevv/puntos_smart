import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/banner_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module_no_login_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/repository/home_repository.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/banner_results.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/results/module_no_login_result.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(HomeState.inital()) {
    on<GetAllBannersEvent>(_getAllBannersEvent);
    on<GetAllModuleNoLoginEvent>(_getAllModuleNoLoginEvent);
  }

  Future<void> _getAllBannersEvent(
      GetAllBannersEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(bannersStatus: BannersStatus.loading));
    await Future.delayed(const Duration(seconds: 5));
    try {
      final response = await _homeRepository.getAllBanners();
      if (response is BannerSuccess) {
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
    await Future.delayed(const Duration(seconds: 5));
    try {
      final response = await _homeRepository.getAllModules();

      if (response is ModuleNoLoginSuccess) {
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
}
