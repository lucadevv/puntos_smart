import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_carrd_product.dart';

class FeatureProductsModuleWidget extends StatelessWidget {
  const FeatureProductsModuleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CustomCardProductWidget(
              index: index,
              onTap: () {
                context.push(
                    '${NameRoutes.homeScreen}/${NameRoutes.moduleScreen}/${NameRoutes.productDetailScreen}/$index');
              },
            ),
          );
        },
      ),
    );
  }
}
