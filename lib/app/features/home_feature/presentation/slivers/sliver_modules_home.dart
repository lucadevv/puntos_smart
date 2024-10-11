import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/item_module_widget.dart';

class SliverModulesHomeWidget extends StatelessWidget {
  const SliverModulesHomeWidget({
    super.key,
    required this.isMore,
    this.index = 1,
  });

  final bool isMore;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverGrid.builder(
        itemCount: isMore ? 9 : 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, idx) {
          return ItemModuleWidget(
            index: idx,
            indexAnimation: index,
            ontap: () {
              context.push(NameRoutes.moduleScreen);
            },
          );
        },
      ),
    );
  }
}
