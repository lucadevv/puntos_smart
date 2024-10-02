import 'package:flutter/material.dart';

class SliverHighlightsSmartHomeWidget extends StatelessWidget {
  const SliverHighlightsSmartHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: size.width,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.primaries[index],
              borderRadius: BorderRadius.circular(25),
            ),
          );
        },
      ),
    );
  }
}
