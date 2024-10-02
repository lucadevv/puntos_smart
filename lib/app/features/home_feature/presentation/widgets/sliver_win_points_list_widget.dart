import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/features/home_feature/domain/profile/profile_model_item.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/pages/profile_page.dart';

class SliverWinPointsListProfile extends StatelessWidget {
  const SliverWinPointsListProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.builder(
        itemCount: winPontsListProfile.length,
        itemBuilder: (context, index) {
          final item = winPontsListProfile[index];
          return CustomItemProfile(
            image: item.image,
            title: item.title,
            widget: item.widget,
          );
        },
      ),
    );
  }
}
