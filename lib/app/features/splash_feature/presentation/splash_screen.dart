import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> _leftImageAnimation;
  late Animation<Offset> _rightImageAnimation;
  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
    // Animación de la imagen que viene desde la izquierda
    _leftImageAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0), // Fuera de la pantalla a la izquierda
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceOut, // Efecto de rebote
      ),
    );
    _rightImageAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0), // Fuera de la pantalla a la derecha
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceOut, // Efecto de rebote
      ),
    );

    animationController.forward();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(const Duration(
      seconds: 2,
    )).then((_) {
      context.go(NameRoutes.homeScreen);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _leftImageAnimation,
              child: Image.asset(
                AppImages.points, // Cambia por tu ruta de imagen
              ),
            ),
            SlideTransition(
              position: _rightImageAnimation,
              child: Image.asset(
                AppImages.smart, // Cambia por tu ruta de imagen
              ),
            ),
          ],
        ),
      ),
    );
  }
}
