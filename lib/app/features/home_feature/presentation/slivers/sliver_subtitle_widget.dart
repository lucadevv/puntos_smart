import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SliverSubtitleWidget extends StatelessWidget {
  const SliverSubtitleWidget({
    super.key,
    this.subTitle = '',
    this.subTitle2 = '',
    this.onTap2,
  });
  final String? subTitle;
  final String? subTitle2;
  final VoidCallback? onTap2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Container(
        width: size.width,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
            horizontal: 16, vertical: subTitle!.isNotEmpty ? 12 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subTitle!,
              style: textTheme.titleMedium!.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      return AppColors.onPrimary.withOpacity(0.1);
                    }
                    return null;
                  },
                ),
              ),
              onPressed: onTap2,
              child: Text(
                subTitle2!,
                style: textTheme.labelMedium!.copyWith(
                  color: AppColors.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
