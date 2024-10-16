import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/slivers/sliver_complete_profile.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/slivers/sliver_button_logout_profile.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/slivers/sliver_header_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/slivers/sliver_point_list_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/slivers/sliver_profile_item.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/slivers/sliver_title_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/slivers/sliver_sopporter_list_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/slivers/sliver_win_points_list_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final authState = state.authStateStatus;
            switch (authState) {
              case AuthStateStatus.authAuthenticated:
                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: kToolbarHeight),
                      sliver: SliverHeaderProfile(
                        size: size,
                        textTheme: textTheme,
                        onTap: () {},
                      ),
                    ),
                    const SliverCompleteProfile(),
                    const SliverProfilesItems(),
                    const SliverTitleProfile(
                        title: AppText.pointsAndSubscription),
                    const SliverBoxPointsListProfile(),
                    const SliverTitleProfile(title: AppText.winPoints),
                    const SliverWinPointsListProfile(),
                    const SliverTitleProfile(title: AppText.smartSupport),
                    const SlvierSopporterListProfile(),
                    SliverButtonLogoutProfile(textTheme: textTheme)
                  ],
                );
              default:
                return CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(
                          "Inicia sesión o registrate para continuar",
                          style: textTheme.headlineLarge!.copyWith(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
