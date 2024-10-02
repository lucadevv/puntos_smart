import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    super.key,
    required this.image,
    required this.ontap,
  });

  final String image;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Stack(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.surface,
                width: 2,
              ),
            ),
            child: Image.asset(image),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: ontap,
                child: const SizedBox(
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
