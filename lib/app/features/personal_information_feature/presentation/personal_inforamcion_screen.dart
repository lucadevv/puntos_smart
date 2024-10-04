import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

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
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black54,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                AppText.personalInformation,
                style: textTheme.titleLarge!.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  onTap: () {},
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
