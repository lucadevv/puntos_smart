import 'package:flutter/material.dart';

class ItemSmartContainer extends StatefulWidget {
  const ItemSmartContainer({
    super.key,
    required this.index,
    this.indexAnimation = 1,
  });

  final int index;
  final int? indexAnimation;

  @override
  State<ItemSmartContainer> createState() => _ItemSmartContainerState();
}

class _ItemSmartContainerState extends State<ItemSmartContainer> {
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
      duration: Duration(
          milliseconds: widget.indexAnimation! * 650 + ((widget.index) * 250)),
      transform: Matrix4.translationValues(myAnimation ? 0 : -560, 0, 0),
      curve: Curves.easeInOut,
      child: Container(
        height: 100,
        width: 260,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.primaries[widget.index],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
