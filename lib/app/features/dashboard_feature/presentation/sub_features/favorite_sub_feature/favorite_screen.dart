import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';

import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/slivers/sliver_search_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/widgets/custom_store_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.unfocus();
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
                        AppText.myFavorities,
                        style: textTheme.bodyLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SliverSearchWidget(
                      showBackIcon: false,
                      safeAreaTop: 0,
                      focusNode: FocusNode(),
                    ),
                    SliverList.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: CustomStoreWidget(
                            index: index,
                            navigateStoreLogo: () {
                              context.push('${NameRoutes.storeScreen}/$index');
                            },
                            navigateStoresTitle: () {
                              context.push('${NameRoutes.storeScreen}/$index');
                            },
                          ),
                        );
                      },
                    )
                  ],
                );

              default:
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      centerTitle: true,
                      backgroundColor: Colors.white,
                      title: Text(
                        AppText.myFavorities,
                        style: textTheme.bodyLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody:
                          false, // Evita que el contenido sea desplazable
                      child: Center(
                        child: Text(
                          "Inicia sesión o registrate para continuar",
                          style: textTheme.headlineLarge!.copyWith(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                  // slivers: [
                  //   SliverAppBar(
                  //     pinned: true,
                  //     automaticallyImplyLeading: false,
                  //     centerTitle: true,
                  //     backgroundColor: Colors.white,
                  //     title: Text(
                  //       AppText.myFavorities,
                  //       style: textTheme.bodyLarge!.copyWith(
                  //         color: Colors.black87,
                  //         fontWeight: FontWeight.w700,
                  //       ),
                  //     ),
                  //   ),
                  //   SliverSearchWidget(
                  //       showBackIcon: false,
                  //       safeAreaTop: 0,
                  //       focusNode: FocusNode()),
                  //   SliverList.builder(
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(bottom: 12),
                  //         child: CustomStoreWidget(
                  //           index: index,
                  //           navigateStoreLogo: () {
                  //             context.push('${NameRoutes.storeScreen}/$index');
                  //           },
                  //           navigateStoresTitle: () {
                  //             context.push('${NameRoutes.storeScreen}/$index');
                  //           },
                  //         ),
                  //       );
                  //     },
                  //   )
                  // ],
                );
            }
          },
        ),
      ),
    );
  }
}
