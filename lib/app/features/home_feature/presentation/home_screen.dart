import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/pages/coupon_page.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/pages/favorite_page.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/pages/game_page.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/pages/home_page.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  int pageIndex = 0;

  selectedPage(int index) {
    setState(() {
      pageIndex = index;
      _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
            SizedBox(
              height: size.height,
              width: size.width,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  // selectedPage(page);
                },
                children: List.generate(pageList.length, (index) {
                  final page = pageList[index];
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;

                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                      }

                      return Transform(
                        transform: Matrix4.identity()
                          ..translate(
                              0.0, 0.0, 200 * (1 - value)) // Efecto en eje Z
                          ..scale(value), // Escala para aplicar el zoom
                        alignment: Alignment.center,
                        child: child,
                      );
                    },
                    child: page,
                  );
                }),
              ),
            ),
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
                  // border: Border.all(
                  //   color: AppColors.descriptionColor,
                  //   width: 1,
                  // ),
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
  HomePage(),
  FavoritePage(),
  GamePage(),
  CouponPage(),
  ProfilePage(),
];
const List<String> navLabels = [
  'Inicio',
  'Favoritos',
  'Juegos',
  'Cupones',
  'Ajustes',
];
