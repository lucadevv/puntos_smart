import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.width,
  });

  final VoidCallback? onTap;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 50,
      width: width,
      child: Stack(
        children: [
          Container(
            height: 50,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: onTap == null ? AppColors.surface : AppColors.onPrimary,
            ),
            child: Text(
              title,
              style: textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: SizedBox(
                  height: 50,
                  width: width,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
