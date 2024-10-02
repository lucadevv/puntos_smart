import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/item_module_widget.dart';

class SliverModulesHomeWidget extends StatelessWidget {
  const SliverModulesHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverGrid.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.push(NameRoutes.moduleScreen);
            },
            child: ItemModuleWidget(
              index: index,
            ),
          );
        },
      ),
    );
  }
}
