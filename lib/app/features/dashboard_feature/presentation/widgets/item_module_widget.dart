import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:puntos_smart_user/app/core/widgets/custom_ontap.dart';

class ItemModuleWidget extends StatefulWidget {
  const ItemModuleWidget({
    super.key,
    required this.index,
    this.ontap,
    this.indexAnimation = 1,
    required this.isLoading,
    this.image,
  });

  final int index;
  final VoidCallback? ontap;
  final int? indexAnimation;
  final bool isLoading;
  final String? image;

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
                color: widget.isLoading ? Colors.grey : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: !widget.isLoading && widget.image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: widget.image!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )
                  : const SizedBox.shrink(),
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
