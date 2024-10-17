import 'package:flutter/material.dart';
import 'package:marquee_list/marquee_list.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';

// import 'package:marquee_list/marquee_list.dart';
// import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SliverTextSpanWidget extends StatelessWidget {
  const SliverTextSpanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Container(
        height: 45,
        width: double.infinity,
        alignment: Alignment.center,
        color: AppColors.cuaternary,
        child: MarqueeList(
          scrollDirection: Axis.horizontal,
          scrollDuration: const Duration(seconds: 3),
          children: [
            Text(
              AppText.answerSurvet,
              style: textTheme.labelLarge!.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
