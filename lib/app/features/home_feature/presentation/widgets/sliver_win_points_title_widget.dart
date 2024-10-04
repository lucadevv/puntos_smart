import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';

class SliverWinPointsTitleProfile extends StatelessWidget {
  const SliverWinPointsTitleProfile({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(bottom: 12, top: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          AppText.winPoints,
          style: textTheme.titleMedium!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
