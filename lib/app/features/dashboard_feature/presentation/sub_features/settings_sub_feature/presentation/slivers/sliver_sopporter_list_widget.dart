import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/profile/profile_model_item.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/widgets/custom_item_profile.dart';

class SlvierSopporterListProfile extends StatelessWidget {
  const SlvierSopporterListProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: smartSupportList.length,
      itemBuilder: (context, index) {
        final item = smartSupportList[index];
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
