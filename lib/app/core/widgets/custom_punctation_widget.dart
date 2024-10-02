import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class CustomPunctationWidget extends StatelessWidget {
  const CustomPunctationWidget({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 20,
      width: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: AppColors.colorStar,
            size: 15,
          ),
          Text(
            '4.5',
            style: textTheme.labelMedium!.copyWith(
              color: AppColors.colorStar,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
