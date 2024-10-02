import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_appbar_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_banner_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_header_home_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_hl_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_modules_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_smarnews_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_subtitle_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final authState = state.authStateStatus;

        switch (authState) {
          case AuthStateStatus.authAuthenticated:
            return CustomScrollView(
              slivers: [
                const SliverAppbarHomePage(),
                const SliverBannersHomeWidget(),
                const SliverSubtitleWidget(subTitle: AppText.modulesSmart),
                const SliverModulesHomeWidget(),
                SliverToBoxAdapter(
                  child: Container(
                    width: size.width,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      AppText.seeMore,
                      style: textTheme.labelMedium!.copyWith(
                        color: AppColors.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SliverSubtitleWidget(subTitle: AppText.smartNew),
                const SliverSmartNewHomeWidget(),
                const SliverSubtitleWidget(subTitle: AppText.highlightsSmart),
                const SliverHighlightsSmartHomeWidget()
              ],
            );

          default:
            return CustomScrollView(
              slivers: [
                const SliverAppbarHomePage(),
                const SliverHeaderHomeWidget(),
                const SliverBannersHomeWidget(),
                const SliverSubtitleWidget(subTitle: AppText.modulesSmart),
                const SliverModulesHomeWidget(),
                SliverToBoxAdapter(
                  child: Container(
                    width: size.width,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      AppText.seeMore,
                      style: textTheme.labelMedium!.copyWith(
                        color: AppColors.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SliverSubtitleWidget(subTitle: AppText.smartNew),
                const SliverSmartNewHomeWidget(),
                const SliverSubtitleWidget(subTitle: AppText.highlightsSmart),
                const SliverHighlightsSmartHomeWidget()
              ],
            );
        }
      },
    );
  }
}
