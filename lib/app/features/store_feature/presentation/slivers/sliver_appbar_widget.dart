import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
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
          padding: const EdgeInsets.only(left: 15), //16
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.primary, //arrowbacButtonColor
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.2), // Color de la sombra con opacidad
                  spreadRadius: 1, // Extensión de la sombra
                  blurRadius: 8, // Desenfoque de la sombra
                  offset:
                      const Offset(0, 4), // Desplazamiento de la sombra (x, y)
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Iconsax.arrow_left_2,
                color: AppColors.blacknew, //Colors.black54,
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
              color: AppColors.primary, //arrowbacButtonColor
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.2), // Color de la sombra con opacidad
                  spreadRadius: 1, // Extensión de la sombra
                  blurRadius: 8, // Desenfoque de la sombra
                  offset:
                      const Offset(0, 4), // Desplazamiento de la sombra (x, y)
                ),
              ],
            ),
            child: const Icon(
              Icons.share_rounded,
              color: AppColors.blacknew,
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
