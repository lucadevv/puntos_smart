import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/widgets/custom_store_widget.dart';

class NewStoresModuleWidget extends StatelessWidget {
  const NewStoresModuleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomStoreWidget(
            index: index,
            navigateStoreLogo: () {
              context.push('${NameRoutes.storeScreen}/$index');
            },
            navigateStoresTitle: () {
              context.push('${NameRoutes.storeScreen}/$index');
            },
          ),
        );
      },
    );
  }
}
