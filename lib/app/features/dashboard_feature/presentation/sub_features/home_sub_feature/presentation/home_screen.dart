import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_appbar_home.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_banner_home.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_header_home_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_hl_home.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_modules_home.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_seemore_home_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_smarnews_home.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/sliver/sliver_subtitle_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMore = false;

  @override
  initState() {
    super.initState();
  }

  _setIsMoreTap() {
    setState(() {
      isMore = !isMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppbarHomePage(),
        BlocSelector<AuthBloc, AuthState, Enum>(
          selector: (state) => state.authStateStatus,
          builder: (context, state) {
            switch (state) {
              case AuthStateStatus.authUnauthenticated:
                return const SliverHeaderHomeWidget(index: 1);
              default:
                return const SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                );
            }
          },
        ),
        const SliverBannersHomeWidget(),
        const SliverSubtitleWidget(subTitle: AppText.modulesSmart),
        SliverModulesHomeWidget(isMore: isMore),
        SliverSeeMoreWidget(isMore: isMore, onTap: _setIsMoreTap),
        const SliverSubtitleWidget(subTitle: AppText.smartNew),
        const SliverSmartNewHomeWidget(),
        const SliverSubtitleWidget(subTitle: AppText.highlightsSmart),
        const SliverHighlightsSmartHomeWidget()
      ],
    );
  }
}
