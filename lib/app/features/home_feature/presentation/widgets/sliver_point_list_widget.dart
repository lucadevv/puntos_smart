import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/features/home_feature/domain/profile/profile_model_item.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/custom_item_profile.dart';

class SliverBoxPointsListProfile extends StatelessWidget {
  const SliverBoxPointsListProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: poinstAndSubscription.length,
      itemBuilder: (context, index) {
        final item = poinstAndSubscription[index];
        return CustomItemProfile(
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
