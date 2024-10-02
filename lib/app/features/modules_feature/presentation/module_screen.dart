import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_appbar_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_banner_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_subtitle_widget.dart';
import 'package:puntos_smart_user/app/features/modules_feature/presentation/widgets/category_module_widget.dart';
import 'package:puntos_smart_user/app/features/modules_feature/presentation/widgets/features_products_module_widget.dart';
import 'package:puntos_smart_user/app/features/modules_feature/presentation/widgets/new_store_module_widget.dart';
import 'package:puntos_smart_user/app/features/modules_feature/presentation/widgets/smart_trend_module_widget.dart';
import 'package:puntos_smart_user/app/features/modules_feature/presentation/widgets/win_points_module_widget.dart';

class ModuleScreen extends StatelessWidget {
  const ModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppbarHomePage(),
          const SliverSubtitleWidget(),
          const SliverBannersHomeWidget(),
          const SliverSubtitleWidget(subTitle: AppText.categories),
          const CategoryModuleWidget(),
          SliverSubtitleWidget(
            subTitle: AppText.winPoints,
            subTitle2: AppText.seeMore,
            onTap2: () {
              context.push(NameRoutes.answerWinScreen);
            },
          ),
          const WinPointsModuleWidget(),
          const SliverSubtitleWidget(subTitle: AppText.smartTrends),
          const SmartTrendsModuleWidget(),
          SliverSubtitleWidget(
            subTitle: AppText.newStores,
            subTitle2: AppText.seeMore,
            onTap2: () {
              context.push(NameRoutes.storesScreen);
            },
          ),
          const NewStoresModuleWidget(),
          const SliverSubtitleWidget(subTitle: AppText.featuredProducts),
          const FeatureProductsModuleWidget(),
        ],
      ),
    );
  }
}
