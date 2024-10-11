import 'package:flutter/material.dart';

class SliverBannersHomeWidget extends StatefulWidget {
  const SliverBannersHomeWidget({
    super.key,
  });

  @override
  State<SliverBannersHomeWidget> createState() =>
      _SliverBannersHomeWidgetState();
}

class _SliverBannersHomeWidgetState extends State<SliverBannersHomeWidget> {
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
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        height: 180,
        width: size.width,
        padding: const EdgeInsets.only(left: 16),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, idx) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 650 + ((idx) * 250)),
              transform:
                  Matrix4.translationValues(myAnimation ? 0 : -560, 0, 0),
              curve: Curves.easeInOut,
              child: Container(
                width: 260,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.primaries[idx],
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
