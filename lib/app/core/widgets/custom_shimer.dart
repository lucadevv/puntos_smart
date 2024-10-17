import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class CustomShimer extends StatelessWidget {
  const CustomShimer({
    super.key,
    required this.width,
    required this.heigh,
    required this.borderRadius,
  });
  final double width;
  final double heigh;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigh,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.descriptionColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
