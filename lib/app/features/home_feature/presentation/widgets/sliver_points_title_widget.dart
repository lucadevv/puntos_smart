import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SliverBoxPointsTitleProfile extends StatelessWidget {
  const SliverBoxPointsTitleProfile({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          AppText.pointsAndSubscription,
          style: textTheme.bodySmall!.copyWith(
            color: AppColors.descriptionColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
