import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/coupon_feature/presentation/widgets/coupon_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/sliver_search_widget.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus
              .unfocus(); // Si quieres liberar el foco, puedes usar esta línea
        }
      },
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final authState = state.authStateStatus;
            switch (authState) {
              case AuthStateStatus.authAuthenticated:
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      centerTitle: true,
                      backgroundColor: Colors.white,
                      title: Text(
                        AppText.myCouponSmart,
                        style: textTheme.bodyLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SliverSearchWidget(
                        showBackIcon: false,
                        safeAreaTop: 0,
                        focusNode: FocusNode()),
                    SliverList.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .push('${NameRoutes.couponsScreen}/1/$index');
                            },
                            child: CouponWidget(
                              index: index,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );

              default:
                return CustomScrollView(
                  // slivers: [
                  //   SliverAppBar(
                  //     pinned: true,
                  //     automaticallyImplyLeading: false,
                  //     centerTitle: true,
                  //     backgroundColor: Colors.white,
                  //     title: Text(
                  //       AppText.myCouponSmart,
                  //       style: textTheme.bodyLarge!.copyWith(
                  //         color: Colors.black87,
                  //         fontWeight: FontWeight.w700,
                  //       ),
                  //     ),
                  //   ),
                  //   SliverFillRemaining(
                  //     hasScrollBody:
                  //         false, // Evita que el contenido sea desplazable
                  //     child: Center(
                  //       child: Text(
                  //         "Inicia sesión o registrate para continuar",
                  //         style: textTheme.headlineLarge!.copyWith(
                  //           color: Colors.black54,
                  //         ),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ],
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      centerTitle: true,
                      backgroundColor: Colors.white,
                      title: Text(
                        AppText.myCouponSmart,
                        style: textTheme.bodyLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SliverSearchWidget(
                        showBackIcon: false,
                        safeAreaTop: 0,
                        focusNode: FocusNode()),
                    SliverList.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .push('${NameRoutes.couponsScreen}/1/$index');
                            },
                            child: CouponWidget(
                              index: index,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
