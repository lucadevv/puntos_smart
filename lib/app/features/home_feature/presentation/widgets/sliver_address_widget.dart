import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/pages/profile_page.dart';

class SliverBoxAdressProfile extends StatelessWidget {
  const SliverBoxAdressProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: CustomItemProfile(
          image: AppImages.maps,
          title: AppText.adresses,
          widget: Icon(
            Icons.navigate_next,
            color: AppColors.onPrimary,
          ),
        ),
      ),
    );
  }
}
