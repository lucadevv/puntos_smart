import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/repository/module_repository.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/module_bloc/module_bloc.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_appbar_home.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_subtitle_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/category_module_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/features_products_module_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/new_store_module_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/smart_trend_module_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/win_points_module_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_bloc.dart';
import 'package:puntos_smart_user/app/injection.dart';

import '../../sliver/module/sliver_banner_module.dart';

class ModuleScreen extends StatelessWidget {
  final int idModule;
  const ModuleScreen({
    super.key,
    required this.idModule,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        context.go(NameRoutes.homeScreen);
      },
      child: BlocProvider(
        lazy: false,
        create: (context) => ModuleBloc(
          homeRepository: getIt<ModuleRepository>(),
          locationBloc: BlocProvider.of<LocationBloc>(context),
        )
          ..add(GetAllGeoPromotions())
          ..add(GetCategoriesPromotions(idModule: idModule))
          ..add(GetAllFlasPromotions())
          ..add(GetAllSurvers()),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              const SliverAppbarHomePage(),
              const SliverSubtitleWidget(),
              const SliverBannersModuleWidget(),
              const SliverSubtitleWidget(
                  subTitle: AppText.categories, index: 2),
              CategoryModuleWidget(
                indexAnimtaion: 3,
                idModule: idModule,
              ),
              SliverSubtitleWidget(
                subTitle: AppText.winPoints,
                subTitle2: AppText.seeMore,
                index: 2,
                onTap2: () {
                  context.push(
                      "${NameRoutes.homeScreen}/${NameRoutes.moduleScreen}/${NameRoutes.answerWinScreen}");
                },
              ),
              const WinPointsModuleWidget(indexAnimation: 6),
              const SliverSubtitleWidget(
                subTitle: AppText.flashPromotions,
                index: 3,
              ),
              const SmartTrendsModuleWidget(),
              SliverSubtitleWidget(
                index: 4,
                subTitle: AppText.newStores,
                subTitle2: AppText.seeMore,
                onTap2: () {
                  context.push(
                      "${NameRoutes.homeScreen}/${NameRoutes.moduleScreen}/${NameRoutes.storesScreen}");
                },
              ),
              const NewStoresModuleWidget(),
              const SliverSubtitleWidget(subTitle: AppText.featuredProducts),
              const FeatureProductsModuleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
