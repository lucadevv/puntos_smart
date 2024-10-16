import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SliverSeeMoreWidget extends StatefulWidget {
  const SliverSeeMoreWidget({
    super.key,
    required this.isMore,
    required this.onTap,
    this.index = 1,
  });

  final bool isMore;
  final int? index;
  final VoidCallback onTap;

  @override
  State<SliverSeeMoreWidget> createState() => _SliverSeeMoreWidgetState();
}

class _SliverSeeMoreWidgetState extends State<SliverSeeMoreWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> _leftImageAnimation;
  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: widget.index! * 200),
      vsync: this,
    );
    super.initState();
    _leftImageAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    Future.delayed(Duration(milliseconds: widget.index! * 200), () {
      if (mounted) {
        animationController.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: SlideTransition(
        position: _leftImageAnimation,
        child: Container(
          width: size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: InkWell(
            onTap: widget.onTap,
            child: Text(
              widget.isMore ? AppText.hide : AppText.seeMore,
              style: textTheme.labelMedium!.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
