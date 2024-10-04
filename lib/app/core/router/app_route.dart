import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/answer_win_detail_feature/presentation/answern_win_detailk_screen.dart';
import 'package:puntos_smart_user/app/features/answer_win_feature/presentation/answer_win_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/login_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/otp_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/register_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/register_with_number_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/reset_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/reset_with_number_screen.dart';
import 'package:puntos_smart_user/app/features/coupon_feature/presentation/coupons_screen.dart';
import 'package:puntos_smart_user/app/features/coupon_feature/presentation/pages/coupon_screen.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/home_screen.dart';
import 'package:puntos_smart_user/app/features/modules_feature/presentation/module_screen.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/presentation/personal_inforamcion_screen.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/presentation/screens/address_screen.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/presentation/screens/favorites_screen.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/presentation/screens/personal_preferences_screen.dart';
import 'package:puntos_smart_user/app/features/product_detail_feature/presentation/product_detail_screen.dart';
import 'package:puntos_smart_user/app/features/products_feature/presentation/products_screen.dart';
import 'package:puntos_smart_user/app/features/rate_store_feature/presentation/rate_store_screen.dart';
import 'package:puntos_smart_user/app/features/splash_feature/presentation/splash_screen.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/store_screen.dart';
import 'package:puntos_smart_user/app/features/stores_feature/presentation/stores_screen.dart';

final appRoute = GoRouter(
  initialLocation: NameRoutes.splash,
  redirect: (context, state) {
    // final authBloc = context.read<AuthBloc>().state;

    // if (authBloc.authStateStatus == AuthStateStatus.authUnauthenticated &&
    //     state.name != NameRoutes.homeScreen) {
    //   return NameRoutes.login;
    // }
    // if (authBloc.authStateStatus == AuthStateStatus.authAuthenticated &&
    //     state.name == NameRoutes.login) {
    //   return NameRoutes.login;
    // }

    return null;
  },
  routes: [
    GoRoute(
      path: NameRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: NameRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: NameRoutes.otpScreen,
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
      path: NameRoutes.resetScreen,
      builder: (context, state) => const ResetScreen(),
    ),
    GoRoute(
      path: NameRoutes.resetScreenWithNumber,
      builder: (context, state) => const ResetWithNumberScreen(),
    ),
    GoRoute(
      path: NameRoutes.registerScreen,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: NameRoutes.registerWithNumber,
      builder: (context, state) => const RegisterWithNumberScreen(),
    ),
    GoRoute(
      path: NameRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),

    /*
     ------------------STORES SCREEN-----------
    */
    GoRoute(
        path: '${NameRoutes.storeScreen}/:idStore',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['idStore']!);
          return StoreScreen(index: id);
        }),
    GoRoute(
      path: NameRoutes.storesScreen,
      builder: (context, state) => const StoresScreen(),
    ),
    //

    GoRoute(
      path: NameRoutes.moduleScreen,
      builder: (context, state) => const ModuleScreen(),
    ),
    GoRoute(
      path: '${NameRoutes.couponsScreen}/:idTienda',
      builder: (context, state) {
        final id = state.pathParameters['idTienda'];
        return CouponsScreen(id: id!);
      },
    ),

    /*
     ------------------PRODUCTS SCREEN-----------
    */
    GoRoute(
      path: NameRoutes.productsScreen,
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: '${NameRoutes.productDetailScreen}/:idProduct',
      builder: (context, state) {
        final id = state.pathParameters['idProduct'];
        return ProductDetailScreen(id: id!);
      },
    ),

    /*
     ------------------ANSWER WIN SCREEN-----------
    */
    GoRoute(
      path: NameRoutes.answerWinScreen,
      builder: (context, state) => const AnswerWinScreen(),
    ),
    GoRoute(
      path: '${NameRoutes.answerWinDetailScreen}/:idAnswer',
      builder: (context, state) {
        final idAnswer = int.parse(state.pathParameters['idAnswer']!);
        return AnswerWinDetailScreen(
          idAnswer: idAnswer,
        );
      },
    ),

    /*
     ------------------COUPONS SCREEN-----------
    */
    GoRoute(
      path: '${NameRoutes.couponsScreen}/:idTienda/:idCoupon',
      pageBuilder: (context, state) {
        final idTienda = state.pathParameters['idTienda'];
        final idCoupon = state.pathParameters['idCoupon'];

        return CustomTransitionPage(
          opaque: false, // Hace que el fondo no sea opaco
          barrierColor:
              Colors.grey.withOpacity(0.4), // Asegura transparencia en el fondo
          child: CounponScreen(
            idTienda: idTienda!,
            idCoupon: idCoupon!,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Definimos la animación de entrada (desde abajo hacia el centro)
            final slideInTransition = Tween<Offset>(
              begin: const Offset(0.0, 1.0), // Empieza desde abajo
              end: Offset.zero, // Termina en su lugar (centro)
            ).animate(animation);

            return SlideTransition(
              position: slideInTransition, // Aplica la transición de entrada
              child: child,
            );
          },
        );
      },
    ),

    /*
     ------------------RATE STORE SCREEN-----------
    */

    GoRoute(
      path: '${NameRoutes.rateStoreScreen}/:idTienda',
      pageBuilder: (context, state) {
        final idTienda = state.pathParameters['idTienda'];

        return CustomTransitionPage(
          opaque: false,
          barrierColor:
              Colors.transparent, // Color transparente para la transición
          child: RateStoreScreen(
            idTienda: idTienda!,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Definimos la animación de entrada (desde abajo hacia el centro)
            final slideInTransition = Tween<Offset>(
              begin: const Offset(0.0, 1.0), // Empieza desde abajo
              end: Offset.zero, // Termina en su lugar (centro)
            ).animate(animation);

            return SlideTransition(
              position: slideInTransition, // Aplica la transición de entrada
              child: child,
            );
          },
        );
      },
    ),
    /*
     ------------------PERSONAL INFORMATION SCREEN-----------
    */

    GoRoute(
      path: NameRoutes.personalInformationScreen,
      builder: (context, state) => const PersonalInforamcionScreen(),
    ),
    GoRoute(
      path: NameRoutes.addressScreen,
      builder: (context, state) => const AddressScreen(),
    ),
    GoRoute(
      path: NameRoutes.personalPreferencesScreen,
      builder: (context, state) => const PersonalPreferencesScreen(),
    ),
    GoRoute(
      path: NameRoutes.favoritesScreen,
      builder: (context, state) => const FavoritesScreen(),
    ),
  ],
);
