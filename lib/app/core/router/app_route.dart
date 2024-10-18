import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/coupon_sub_feature/coupon_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/favorite_sub_feature/favorite_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/game_sub_feature/game_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/home_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/answer_win_detail/presentation/answern_win_detailt_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/answers_win/presentation/answer_win_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/login_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/otp_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/register_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/register_with_number_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/reset_screen.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/pages/reset_with_number_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/coupon_store/presentation/coupons_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/coupon_store/presentation/pages/coupon_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/dashboard_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/module_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/profile_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/add_adresss_page.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/personal_information_page/personal_inforamcion_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/address_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/favorites_page/favorites_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/personal_preferences_page/personal_preferences_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/product_detail/presentation/product_detail_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/category/presentation/category_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/rate_store_feature/presentation/rate_store_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/support/presentation/faq_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/support/presentation/privacy_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/support/presentation/support_services_screen.dart';
import 'package:puntos_smart_user/app/features/splash_feature/presentation/splash_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/store_detail_screen.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/stores/presentation/stores_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Shell');
final appRoute = GoRouter(
  initialLocation: NameRoutes.splash,
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state) {
    debugPrint('Ruta actual: ${state.uri.toString()}');
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
      routes: [
        GoRoute(
          path: "${NameRoutes.otpScreen}/:idPage",
          builder: (context, state) {
            final idPage = int.parse(state.pathParameters['idPage']!);
            return OtpScreen(idPage: idPage);
          },
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
      ],
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => DashboardScreen(child: child),
      routes: [
        GoRoute(
          path: NameRoutes.homeScreen,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            name: state.fullPath,
            child: const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
          routes: [
            GoRoute(
              path: NameRoutes.moduleScreen,
              builder: (context, state) => const ModuleScreen(),
              routes: [
                GoRoute(
                  path: NameRoutes.categorysScreen,
                  builder: (context, state) => const CateogryScreen(),
                  routes: [
                    GoRoute(
                      path: '${NameRoutes.productDetailScreen}/:idProduct',
                      builder: (context, state) {
                        final id = state.pathParameters['idProduct'];
                        return ProductDetailScreen(id: id!);
                      },
                    ),
                  ],
                ),
                GoRoute(
                  path: NameRoutes.answerWinScreen,
                  builder: (context, state) => const AnswerWinScreen(),
                  routes: [
                    GoRoute(
                      path: '${NameRoutes.answerWinDetailScreen}/:idAnswer',
                      builder: (context, state) {
                        final idAnswer =
                            int.parse(state.pathParameters['idAnswer']!);
                        return AnswerWinDetailScreen(
                          idAnswer: idAnswer,
                        );
                      },
                    ),
                  ],
                ),
                GoRoute(
                  path: NameRoutes.storesScreen,
                  builder: (context, state) => const StoresScreen(),
                  routes: [
                    GoRoute(
                      path: '${NameRoutes.storeDetailScreen}/:idStore',
                      builder: (context, state) {
                        final id = int.parse(state.pathParameters['idStore']!);
                        return StoreDetailScreen(index: id);
                      },
                      routes: [
                        GoRoute(
                          path: '${NameRoutes.productDetailScreen}/:idProduct',
                          builder: (context, state) {
                            final id = state.pathParameters['idProduct'];
                            return ProductDetailScreen(id: id!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
/*
--------------------------MODULE SCREEN-------------------
*/
                GoRoute(
                  path: '${NameRoutes.storeDetailScreen}/:idStore',
                  builder: (context, state) {
                    final id = int.parse(state.pathParameters['idStore']!);
                    return StoreDetailScreen(index: id);
                  },
                ),
                GoRoute(
                  path: '${NameRoutes.answerWinDetailScreen}/:idAnswer',
                  builder: (context, state) {
                    final idAnswer =
                        int.parse(state.pathParameters['idAnswer']!);
                    return AnswerWinDetailScreen(
                      idAnswer: idAnswer,
                    );
                  },
                ),
                GoRoute(
                  path: '${NameRoutes.productDetailScreen}/:idProduct',
                  builder: (context, state) {
                    final id = state.pathParameters['idProduct'];
                    return ProductDetailScreen(id: id!);
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: NameRoutes.favoriteScreen,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const FavoriteScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
        ),
        GoRoute(
          path: NameRoutes.gameScreen,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const GameScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
        ),
        GoRoute(
          path: NameRoutes.myCouponScreen,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const MyCouponScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
        ),
        GoRoute(
          path: NameRoutes.settingsScreen,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const SettingsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
          routes: [
            GoRoute(
              path: NameRoutes.personalInformationScreen,
              builder: (context, state) => const PersonalInforamcionScreen(),
            ),
            GoRoute(
              path: NameRoutes.addressScreen,
              builder: (context, state) => const AddressScreen(),
              routes: [
                GoRoute(
                  path: NameRoutes.addAddressPage,
                  builder: (context, state) => const AddAddressPage(),
                ),
              ],
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
        ),
      ],
    ),
    GoRoute(
      path: '${NameRoutes.couponsScreen}/:idTienda',
      builder: (context, state) {
        final id = state.pathParameters['idTienda'];
        return CouponsScreen(id: id!);
      },
    ),
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
     ------------------ MODULO SOPORTE SMART -----------
    */
    GoRoute(
      path: NameRoutes.privacyPolicyScreen,
      //builder: (context, state) => const PrivacyScreen(),
      builder: (context, state) {
        final bool isPrivacyPolicies = state.extra as bool? ?? true;
        return PrivacyScreen(isPrivacyPolicies: isPrivacyPolicies);
      },
    ),
    GoRoute(
      path: NameRoutes.faqScreen,
      builder: (context, state) => const FaqScreen(),
    ),
    GoRoute(
      path: NameRoutes.supportServicesScreen,
      builder: (context, state) => const SupportServicesScreen(),
    ),
  ],
);
