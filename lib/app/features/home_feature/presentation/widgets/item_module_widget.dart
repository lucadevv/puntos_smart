import 'package:flutter/material.dart';

class ItemModuleWidget extends StatelessWidget {
  const ItemModuleWidget({
    super.key,
    required this.index,
    this.ontap,
  });

  final int index;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 110,
      child: Stack(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.primaries[index],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: ontap,
              ),
            ),
          )
        ],
      ),
    );
  }
}
