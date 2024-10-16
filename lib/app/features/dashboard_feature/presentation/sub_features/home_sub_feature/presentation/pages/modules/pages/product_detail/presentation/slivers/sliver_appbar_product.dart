import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SliverAppbarProductWidget extends StatelessWidget {
  const SliverAppbarProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      leadingWidth: 66,
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 4),
        child: InkWell(
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
              Iconsax.arrow_left_2, //Icons.arrow_back_ios,
              color: AppColors.blacknew, //black54
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://www.businessempresarial.com.pe/wp-content/uploads/2024/05/Dia-de-la-Hamburguesa-02-scaled.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
