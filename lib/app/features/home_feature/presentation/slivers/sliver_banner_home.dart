import 'package:flutter/material.dart';

class SliverBannersHomeWidget extends StatelessWidget {
  const SliverBannersHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        height: 180,
        width: size.width,
        padding: const EdgeInsets.only(left: 16),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 260,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.primaries[index],
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
      ),
    );
  }
}
