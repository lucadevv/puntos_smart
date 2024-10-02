import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

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
            color: AppColors.arrowbacButtonColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black54,
        ),
      ),
    );
  }
}
