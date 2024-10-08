import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';

class CustomButtonArrowBack extends StatelessWidget {
  const CustomButtonArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: AppColors.greyligth,
            borderRadius: BorderRadius.circular(12)),
        child: const Icon(
          Iconsax.arrow_left_2,
          color: AppColors.blacknew, //greymedium
        ),
      ),
    );
  }
}
