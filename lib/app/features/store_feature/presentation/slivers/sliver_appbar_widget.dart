import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/custom_store_widget.dart';

class SliverAppbarWidget extends StatelessWidget {
  const SliverAppbarWidget({
    super.key,
    required double sliverAppBarHeight,
    required this.textTheme,
    required this.index,
  }) : _sliverAppBarHeight = sliverAppBarHeight;

  final double _sliverAppBarHeight;
  final TextTheme textTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _sliverAppBarHeight,
      pinned: false,
      backgroundColor: AppColors.cuaternary,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: AppColors.arrowbacButtonColor,
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: AppColors.arrowbacButtonColor,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.share_rounded,
              color: Colors.black54,
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          fit: StackFit.loose,
          children: [
            Image.network(
              'https://cdn2.cocinadelirante.com/sites/default/files/images/2024/06/hamburguesa-con-tocino.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 450,
              // height: 350,
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Hero(
                tag: "stores-$index",
                child: CustomStoreWidget(
                  index: index,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
