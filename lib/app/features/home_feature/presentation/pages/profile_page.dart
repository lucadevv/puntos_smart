import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_address_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_appbar_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_button_logout_profile.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_header_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_point_list_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_points_title_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_soporter_title_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_sopporter_list_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_win_points_list_widget.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/sliver_win_points_title_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                    SliverAppbarProfile(textTheme: textTheme),
                    SliverHeaderProfile(size: size, textTheme: textTheme),
                    const SliverBoxAdressProfile(),
                    SliverBoxPointsTitleProfile(textTheme: textTheme),
                    const SliverBoxPointsListProfile(),
                    SliverWinPointsTitleProfile(textTheme: textTheme),
                    const SliverWinPointsListProfile(),
                    SliverSopporterTitleProfile(textTheme: textTheme),
                    const SlvierSopporterListProfile(),
                    SliverButtonLogoutProfile(textTheme: textTheme)
                  ],
                );
              default:
                return CustomScrollView(
                  slivers: [
                    SliverAppbarProfile(textTheme: textTheme),
                    SliverHeaderProfile(size: size, textTheme: textTheme),
                    const SliverBoxAdressProfile(),
                    SliverBoxPointsTitleProfile(textTheme: textTheme),
                    const SliverBoxPointsListProfile(),
                    SliverWinPointsTitleProfile(textTheme: textTheme),
                    const SliverWinPointsListProfile(),
                    SliverSopporterTitleProfile(textTheme: textTheme),
                    const SlvierSopporterListProfile(),
                    SliverToBoxAdapter(
                      child: Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 32),
                        height: 100,
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

class CustomItemProfile extends StatelessWidget {
  const CustomItemProfile({
    super.key,
    required this.image,
    required this.title,
    required this.widget,
  });

  final String image;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 50,
      width: size.width,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.onPrimary,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 12),
          Text(
            title,
            style: textTheme.bodyMedium!.copyWith(
              color: AppColors.descriptionColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          widget,
        ],
      ),
    );
  }
}
