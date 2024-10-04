import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class CustomOnTap extends StatelessWidget {
  const CustomOnTap({
    super.key,
    required this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: AppColors.onPrimary.withOpacity(0.2),
          overlayColor: WidgetStateProperty.all(
            AppColors.onPrimary.withOpacity(0.2),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
