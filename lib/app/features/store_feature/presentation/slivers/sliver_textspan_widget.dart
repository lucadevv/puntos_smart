import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:text_marquee/text_marquee.dart';

class SliverTextSpanWidget extends StatelessWidget {
  const SliverTextSpanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 45,
          alignment: Alignment.center,
          color: AppColors.cuaternary,
          child: TextMarquee(
            AppText.answerSurvet,
            spaceSize: 72,
            delay: Duration.zero,
            duration: const Duration(seconds: 10),
            style: textTheme.labelLarge!.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
