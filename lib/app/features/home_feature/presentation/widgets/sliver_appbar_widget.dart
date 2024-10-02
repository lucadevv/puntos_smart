import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';

class SliverAppbarProfile extends StatelessWidget {
  const SliverAppbarProfile({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        AppText.profile,
        style: textTheme.bodyLarge!.copyWith(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
