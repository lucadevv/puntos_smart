import 'package:flutter/material.dart';

class SliverTitleProfile extends StatelessWidget {
  const SliverTitleProfile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(bottom: 12, top: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          title,
          style: textTheme.titleMedium!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
