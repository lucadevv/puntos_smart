import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SliverAppbarHomePage extends StatelessWidget {
  const SliverAppbarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            AppText.myLocation,
            style: textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.descriptionColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Jr. Sol de Oro, Los Olivos, Lima ....',
            style: textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Image.asset(
          AppImages.logoPuntosSmart,
          width: 10,
          height: 10,
          fit: BoxFit.contain,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            size: 30,
            Iconsax.notification5,
            color: AppColors.descriptionColor,
          ),
        ),
      ],
    );
  }
}
