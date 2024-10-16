import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/widgets/custom_item_profile.dart';

class SliverBoxAdressProfile extends StatelessWidget {
  const SliverBoxAdressProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: CustomItemProfile(
          //image: AppImages.maps,
          icon: Iconsax.map,
          title: AppText.adresses,
          widget: const Icon(
            Icons.navigate_next,
            color: AppColors.onPrimary,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
