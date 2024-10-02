import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    required this.onTap,
    required this.heigh,
    required this.width,
  });

  final VoidCallback onTap;
  final double heigh;
  final double width;

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
        child: Image.asset(AppImages.coupon),
      ),
    );
  }
}
