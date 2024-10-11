import 'package:flutter/material.dart';

import 'package:puntos_smart_user/app/core/widgets/custom_ontap.dart';

class ItemModuleWidget extends StatefulWidget {
  const ItemModuleWidget({
    super.key,
    required this.index,
    this.ontap,
    this.indexAnimation = 1,
  });

  final int index;
  final VoidCallback? ontap;
  final int? indexAnimation;

  @override
  State<ItemModuleWidget> createState() => _ItemModuleWidgetState();
}

class _ItemModuleWidgetState extends State<ItemModuleWidget> {
  double width = 0;
  bool myAnimation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((time) {
      setState(() {
        myAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 650 + ((widget.index) * 150)),
      transform: Matrix4.translationValues(myAnimation ? 0 : -550, 0, 0),
      curve: Curves.easeInOut,
      child: SizedBox(
        height: 110,
        width: 110,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.primaries[widget.index],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CustomOnTap(onTap: widget.ontap),
            ),
          ],
        ),
      ),
    );
  }
}
