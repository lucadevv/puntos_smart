import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SliverSubtitleWidget extends StatefulWidget {
  const SliverSubtitleWidget({
    super.key,
    this.subTitle = '',
    this.subTitle2 = '',
    this.onTap2,
    this.index = 1,
  });
  final String? subTitle;
  final String? subTitle2;
  final VoidCallback? onTap2;
  final int? index;

  @override
  State<SliverSubtitleWidget> createState() => _SliverSubtitleWidgetState();
}

class _SliverSubtitleWidgetState extends State<SliverSubtitleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> _leftImageAnimation;
  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: widget.index! * 250),
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
    Future.delayed(Duration(milliseconds: widget.index! * 250), () {
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
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: widget.subTitle!.isNotEmpty ? 12 : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.subTitle!,
                style: textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return AppColors.onPrimary.withOpacity(0.1);
                      }
                      return null;
                    },
                  ),
                ),
                onPressed: widget.onTap2,
                child: Text(
                  widget.subTitle2!,
                  style: textTheme.labelMedium!.copyWith(
                    color: AppColors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
