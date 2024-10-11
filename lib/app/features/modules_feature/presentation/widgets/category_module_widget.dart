import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/item_module_widget.dart';

class CategoryModuleWidget extends StatelessWidget {
  const CategoryModuleWidget({
    super.key,
    this.indexAnimtaion = 1,
  });
  final int? indexAnimtaion;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 110,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 16),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ItemModuleWidget(
                index: index,
                indexAnimation: indexAnimtaion,
                ontap: () {
                  context.push(NameRoutes.productsScreen);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
