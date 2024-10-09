import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/sigin_bloc/sign_in_bloc.dart';

class SliverButtonLogoutProfile extends StatelessWidget {
  const SliverButtonLogoutProfile({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 32),
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset(AppImages.close),
            const Icon(
              Iconsax.logout,
              color: Colors.red,
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignOutRequested());
                context.read<SignInBloc>().add(ClearUserAndPassword());
              },
              child: Text(
                AppText.logOut,
                style: textTheme.titleMedium!.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
