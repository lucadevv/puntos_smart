import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/home_feature/domain/repository/home_repository.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/bloc/home_bloc.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_appbar_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_banner_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_header_home_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_hl_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_modules_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_seemore_home_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_smarnews_home.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/slivers/sliver_subtitle_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return BlocProvider(
      lazy: false,
      create: (context) => HomeBloc(
        homeRepository: GetIt.instance<HomeRepository>(),
      )..add(GetAllBannersEvent()),
      child: CustomScrollView(
        slivers: [
          const SliverAppbarHomePage(),
          const SliverBannersHomeWidget(),
          const SliverSubtitleWidget(subTitle: AppText.modulesSmart),
          SliverModulesHomeWidget(isMore: isMore),
          SliverSeeMoreWidget(isMore: isMore, onTap: _setIsMoreTap),
          const SliverSubtitleWidget(subTitle: AppText.smartNew),
          const SliverSmartNewHomeWidget(),
          const SliverSubtitleWidget(subTitle: AppText.highlightsSmart),
          const SliverHighlightsSmartHomeWidget()
        ],
      ),
    );
    // return BlocBuilder<AuthBloc, AuthState>(
    //   builder: (context, state) {
    //     final authState = state.authStateStatus;
    //     print(authState);
    //     switch (authState) {
    //       case AuthStateStatus.authAuthenticated:
    //         return CustomScrollView(
    //           slivers: [
    //             const SliverAppbarHomePage(),
    //             const SliverBannersHomeWidget(),
    //             const SliverSubtitleWidget(subTitle: AppText.modulesSmart),
    //             SliverModulesHomeWidget(isMore: isMore),
    //             SliverSeeMoreWidget(isMore: isMore, onTap: _setIsMoreTap),
    //             const SliverSubtitleWidget(subTitle: AppText.smartNew),
    //             const SliverSmartNewHomeWidget(),
    //             const SliverSubtitleWidget(subTitle: AppText.highlightsSmart),
    //             const SliverHighlightsSmartHomeWidget()
    //           ],
    //         );

    //       default:
    //         return CustomScrollView(
    //           slivers: [
    //             const SliverAppbarHomePage(),
    //             const SliverHeaderHomeWidget(index: 1),
    //             const SliverBannersHomeWidget(),
    //             const SliverSubtitleWidget(
    //                 subTitle: AppText.modulesSmart, index: 2),
    //             SliverModulesHomeWidget(isMore: isMore, index: 3),
    //             SliverSeeMoreWidget(
    //                 isMore: isMore, onTap: _setIsMoreTap, index: 4),
    //             const SliverSubtitleWidget(
    //                 subTitle: AppText.smartNew, index: 4),
    //             const SliverSmartNewHomeWidget(index: 4),
    //             const SliverSubtitleWidget(
    //                 subTitle: AppText.highlightsSmart, index: 5),
    //             const SliverHighlightsSmartHomeWidget()
    //           ],
    //         );
    //     }
    //   },
    // );
  }
}
