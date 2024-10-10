import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/features/home_feature/domain/profile/profile_model_item.dart';

import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/custom_item_profile.dart';

class SliverWinPointsListProfile extends StatelessWidget {
  const SliverWinPointsListProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: winPontsListProfile.length,
      itemBuilder: (context, index) {
        final item = winPontsListProfile[index];
        return CustomItemProfile(
          //image: item.image,
          icon: item.icon,
          title: item.title,
          widget: item.widget,
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey.shade300,
        );
      },
    );
  }
}
