import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/sigin_bloc/sign_in_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';

class SliverHeaderHomeWidget extends StatelessWidget {
  const SliverHeaderHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Container(
        height: 80,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText.welcomeSmarter,
                  style: textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                Text(
                  AppText.welcomeSmarter2,
                  style: textTheme.headlineLarge!.copyWith(
                    color: AppColors.onPrimary,
                    fontFamily: 'Bungee',
                    //fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButtonWidget(
              onTap: () {
                context.read<SignInBloc>().add(LoadSavedCredentials());
                context.push(NameRoutes.login);
              },
              title: AppText.login,
              width: 140,
            )
          ],
        ),
      ),
    );
  }
}
