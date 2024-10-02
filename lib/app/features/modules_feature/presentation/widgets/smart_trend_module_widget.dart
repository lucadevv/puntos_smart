import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/item_smart_container.dart';

class SmartTrendsModuleWidget extends StatelessWidget {
  const SmartTrendsModuleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return ItemSmartContainer(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
