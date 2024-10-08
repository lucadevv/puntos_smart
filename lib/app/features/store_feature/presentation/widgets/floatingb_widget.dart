import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    required this.onTap,
    required this.heigh,
    required this.width,
    this.floating = false,
  });

  final VoidCallback onTap;
  final double heigh;
  final double width;
  final bool? floating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heigh,
        width: width,
        decoration: const BoxDecoration(
          color: AppColors.tertiary,
          shape: BoxShape.circle,
        ),
        //child: Image.asset(AppImages.coupon),
        child: Icon(
          Iconsax.tag,
          size: floating == true ? 40 : 24,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
