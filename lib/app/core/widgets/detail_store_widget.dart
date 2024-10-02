import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class DetailStoreWidget extends StatelessWidget {
  const DetailStoreWidget({
    super.key,
    required this.iconImage,
    required this.title,
    this.makePhoneTap,
  });

  final String iconImage;
  final String title;
  final VoidCallback? makePhoneTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(iconImage),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          splashColor: AppColors.onPrimary,
          onTap: makePhoneTap,
          child: Text(
            title,
            style: textTheme.bodySmall!.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
