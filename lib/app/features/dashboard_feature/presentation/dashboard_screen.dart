import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';

import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/coupon_sub_feature/coupon_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/favorite_sub_feature/favorite_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/game_sub_feature/game_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/home_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  final Widget child;
  const DashboardScreen({super.key, required this.child});

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  int pageIndex = 0;

  selectedPage(int index) {
    setState(() {
      pageIndex = index;
      // _pageController.animateToPage(
      //   pageIndex,
      //   duration: const Duration(milliseconds: 500),
      //   curve: Curves.easeInOut,
      // );
    });

    switch (pageIndex) {
      case 0:
        context.go(NameRoutes.homeScreen);
        break;
      case 1:
        context.go(NameRoutes.favoriteScreen);
        break;
      case 2:
        context.go(NameRoutes.gameScreen);
        break;
      case 3:
        context.go(NameRoutes.myCouponScreen);
        break;
      case 4:
        context.go(NameRoutes.settingsScreen);
        break;
      default:
        context.go(NameRoutes.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            widget.child,
            Positioned(
              bottom: kToolbarHeight * 0.5,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                height: 65,
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Color de la sombra con opacidad
                      spreadRadius: 1, // Extensión de la sombra
                      blurRadius: 8, // Desenfoque de la sombra
                      offset: const Offset(
                          0, 4), // Desplazamiento de la sombra (x, y)
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(navList.length, (index) {
                    final icon = navList[index];
                    final label = navLabels[index];

                    return GestureDetector(
                      onTap: () {
                        selectedPage(index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            size: 28,
                            color: pageIndex == index
                                ? AppColors.onPrimary
                                : AppColors.descriptionColor,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            label,
                            style: TextStyle(
                              fontSize: 12,
                              color: pageIndex == index
                                  ? AppColors.onPrimary
                                  : AppColors.descriptionColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: (kToolbarHeight * 0.7) + (size.height * 0.08),
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.floatingButton,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.message,
                      color: Colors.white,
                      size: 35,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

const List<IconData> navList = [
  Iconsax.home,
  Iconsax.heart,
  Iconsax.game,
  Iconsax.ticket,
  Iconsax.setting_2,
];
const List<Widget> pageList = [
  HomeScreen(),
  FavoriteScreen(),
  GameScreen(),
  MyCouponScreen(),
  SettingsScreen(),
];
const List<String> navLabels = [
  'Inicio',
  'Favoritos',
  'Juegos',
  'Cupones',
  'Ajustes',
];
