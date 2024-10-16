import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';

class SliverSopporterTitleProfile extends StatelessWidget {
  const SliverSopporterTitleProfile({
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
          AppText.smartSupport,
          style: textTheme.titleMedium!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
