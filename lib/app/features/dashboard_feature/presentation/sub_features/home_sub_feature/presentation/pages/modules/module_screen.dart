import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_appbar_home.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_banner_home.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_subtitle_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/category_module_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/features_products_module_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/new_store_module_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/smart_trend_module_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/widgets/win_points_module_widget.dart';

class ModuleScreen extends StatelessWidget {
  const ModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        context.go(NameRoutes.homeScreen);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppbarHomePage(),
            const SliverSubtitleWidget(),
            const SliverBannersHomeWidget(),
            const SliverSubtitleWidget(subTitle: AppText.categories, index: 2),
            const CategoryModuleWidget(indexAnimtaion: 3),
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
              subTitle: AppText.smartTrends,
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
    );
  }
}
