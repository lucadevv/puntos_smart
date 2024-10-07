import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class CustomButtonWidgetSocial extends StatelessWidget {
  const CustomButtonWidgetSocial({
    super.key,
    this.onTap,
    required this.title,
    required this.width,
    required this.image,
  });

  final VoidCallback? onTap;
  final String title;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 56,
      width: width,
      child: Stack(
        children: [
          Container(
            height: 56,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: onTap == null ? AppColors.surface : AppColors.greyligth,
            ),
            // child: Text(title,
            //     style: TextStyle(
            //         fontSize: 16.0,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.white)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: 24,
                  height: 24,
                ), // Muestra la imagen al lado izquierdo
                const SizedBox(width: 8), // Espacio entre la imagen y el texto
                Text(
                  title,
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.greymedium,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: SizedBox(
                  height: 56,
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
