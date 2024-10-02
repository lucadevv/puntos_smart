import 'package:flutter/material.dart';

class ItemSmartContainer extends StatelessWidget {
  const ItemSmartContainer({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 260,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.primaries[index],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
