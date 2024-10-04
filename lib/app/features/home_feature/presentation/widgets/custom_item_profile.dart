import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_ontap.dart';

class CustomItemProfile extends StatelessWidget {
  const CustomItemProfile({
    super.key,
    required this.image,
    required this.title,
    required this.widget,
    this.onTap,
  });

  final String image;
  final String title;
  final Widget widget;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 50,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: 50,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Image.asset(
                  image,
                  scale: 1.1,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                widget,
              ],
            ),
          ),
          CustomOnTap(onTap: onTap)
        ],
      ),
    );
  }
}
