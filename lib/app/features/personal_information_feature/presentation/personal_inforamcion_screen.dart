import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

import '../../../core/widgets/custom_arrow_back.dart';

class PersonalInforamcionScreen extends StatelessWidget {
  const PersonalInforamcionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            // leading: InkWell(
            //   onTap: () {
            //     context.pop();
            //   },
            //   child: const Icon(
            //     Icons.arrow_back_ios_new,
            //     color: Colors.black54,
            //   ),
            // ),
            leadingWidth: 70,
            leading: const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 4),
              child: CustomButtonArrowBack(),
            ),
            centerTitle: true,
            title: Text(
              AppText.personalInformation,
              style: textTheme.bodyLarge!.copyWith(
                color: AppColors.blacknew,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //     child: Text(
          //       AppText.personalInformation,
          //       style: textTheme.titleLarge!.copyWith(
          //         color: Colors.black87,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Iconsax.user_edit,
                    color: AppColors.onPrimary,
                  ),
                  title: Text(
                    "Mis datos personales",
                    style: textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    "Nombre frecha de nacimiento y género",
                    style: textTheme.bodySmall!.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: AppColors.onPrimary,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Iconsax.user_edit,
                    color: AppColors.onPrimary,
                  ),
                  title: Text(
                    "Actualizar contraseña",
                    style: textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: AppColors.onPrimary,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Iconsax.user_minus,
                    color: AppColors.onPrimary,
                  ),
                  title: Text(
                    "Eliminar cuenta",
                    style: textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: AppColors.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
