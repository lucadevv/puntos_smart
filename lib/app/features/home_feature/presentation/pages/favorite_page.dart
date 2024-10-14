import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/extension/custom_extension.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/widgets/item_smart_container.dart';

import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/sliver_search_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/custom_store_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_arrow_back.dart';
import '../../../../core/widgets/custom_carrd_product.dart';
import '../../../../core/widgets/skeleton.dart';
import '../../../auth_feature/presentation/widgets/custom_button_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> {
  int _page = 0;
  late PageController _pageController;
  bool _isLoading = true;

  @override
  void initState() {
    _pageController = PageController(initialPage: _page);
    super.initState();

    // Simula la carga durante 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _selectedPage(int page) {
    setState(() {
      _page = page;
      _pageController.animateToPage(
        _page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutSine,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
              child: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
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
                      focusNode: FocusNode()),
                  // tiendas productos
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _selectedPage(0);
                                  },
                                  child: Container(
                                    width: size.width * 0.5,
                                    alignment: Alignment.center,
                                    child: Text(
                                      AppText.stores,
                                      style: textTheme.titleSmall!.copyWith(
                                        color: _page == 0
                                            ? AppColors.onPrimary
                                            : AppColors.greymedium,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _selectedPage(1);
                                  },
                                  child: Container(
                                    width: size.width * 0.5,
                                    alignment: Alignment.center,
                                    child: Text(
                                      AppText.products,
                                      style: textTheme.titleSmall!.copyWith(
                                        color: _page == 1
                                            ? AppColors.onPrimary
                                            : AppColors.greymedium,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedAlign(
                            alignment: _page == 0
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              height: 2.5,
                              width: size.width * 0.5,
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: SizedBox(
                      // height: 100,
                      // width: 100,
                      height: size.height,
                      width: size.width,
                      child: PageView(
                        controller: _pageController,
                        physics: const BouncingScrollPhysics(), //
                        onPageChanged: (value) {
                          _selectedPage(value);
                        },
                        // children: [
                        //   Container(
                        //     padding: const EdgeInsets.symmetric(horizontal: 32),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           AppText.emptyStoreTtitle,
                        //           style: textTheme.titleLarge!.copyWith(
                        //             color: Colors.black87,
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //         12.hSpace,
                        //         Text(
                        //           AppText.emptyStoreSubtitle,
                        //           style: textTheme.titleSmall!.copyWith(
                        //             color: Colors.black45,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       ],
                        //     ),
                        //   ),

                        //   Container(
                        //     padding: const EdgeInsets.symmetric(horizontal: 32),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           AppText.emptyProductsTitle,
                        //           style: textTheme.titleLarge!.copyWith(
                        //             color: Colors.black87,
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //         12.hSpace,
                        //         Text(
                        //           AppText.emptyProductsSubtitle,
                        //           style: textTheme.titleSmall!.copyWith(
                        //             color: Colors.black45,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       ],
                        //     ),
                        //   ),

                        // ],

                        children: [
                          CustomScrollView(
                            slivers: [
                              _isLoading
                                  ? SliverList.builder(
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8, top: 12),
                                          child: tiendas_skeleton(),
                                        );
                                      },
                                    )
                                  : SliverList.builder(
                                      itemCount:
                                          10, // Número de tiendas a mostrar
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8, top: 12),
                                          child: CustomStoreWidget(
                                            key: ValueKey(
                                                index), // Clave única por tienda
                                            index:
                                                index, // Mostrar las tiendas reales
                                          ),
                                        );
                                      },
                                    ),
                              const SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 400,
                                ),
                              ),
                            ],
                          ),
                          // Página de productos
                          CustomScrollView(
                            slivers: [
                              _isLoading
                                  ? SliverList.builder(
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8, top: 12),
                                          child: items_skeleton(),
                                        );
                                      },
                                    )
                                  : SliverList.builder(
                                      itemCount:
                                          5, // Número de productos a mostrar
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8,
                                              left: 10,
                                              right: 10,
                                              top: 12),
                                          child: CustomCardProductWidget(
                                            key: ValueKey(
                                                'product_$index'), // Clave única por producto
                                            index:
                                                index, // Mostrar los productos reales
                                          ),
                                        );
                                      },
                                    ),
                              const SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: kToolbarHeight * 0.5,
            //   left: 0,
            //   right: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     child: CustomButtonWidget(
            //       title: _page == 0 ? "Buscar tiendas" : "Buscar productos",
            //       width: size.width,
            //       onTap: () {},
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

//

// @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return GestureDetector(
//       onTap: () {
//         FocusScopeNode currentFocus = FocusScope.of(context);
//         if (!currentFocus.hasPrimaryFocus &&
//             currentFocus.focusedChild != null) {
//           currentFocus.unfocus();
//         }
//       },
//       child: Scaffold(
//         body: BlocBuilder<AuthBloc, AuthState>(
//           builder: (context, state) {
//             final authState = state.authStateStatus;

//             switch (authState) {
//               case AuthStateStatus.authAuthenticated:
//                 return CustomScrollView(
//                   slivers: [
//                     SliverAppBar(
//                       pinned: true,
//                       automaticallyImplyLeading: false,
//                       centerTitle: true,
//                       backgroundColor: Colors.white,
//                       title: Text(
//                         AppText.myFavorities,
//                         style: textTheme.bodyLarge!.copyWith(
//                           color: Colors.black87,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     SliverSearchWidget(
//                         showBackIcon: false,
//                         safeAreaTop: 0,
//                         focusNode: FocusNode()),
//                     SliverList.builder(
//                       itemCount: 10,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 12),
//                           child: CustomStoreWidget(
//                             index: index,
//                             navigateStoreLogo: () {
//                               context.push('${NameRoutes.storeScreen}/$index');
//                             },
//                             navigateStoresTitle: () {
//                               context.push('${NameRoutes.storeScreen}/$index');
//                             },
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 );

//               default:
//                 return CustomScrollView(

//                   slivers: [
//                     SliverAppBar(
//                       pinned: true,
//                       automaticallyImplyLeading: false,
//                       centerTitle: true,
//                       backgroundColor: Colors.white,
//                       title: Text(
//                         AppText.myFavorities,
//                         style: textTheme.bodyLarge!.copyWith(
//                           color: Colors.black87,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     SliverSearchWidget(
//                         showBackIcon: false,
//                         safeAreaTop: 0,
//                         focusNode: FocusNode()),
//                     SliverList.builder(
//                       itemCount: 10,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 12),
//                           child: CustomStoreWidget(
//                             index: index,
//                             navigateStoreLogo: () {
//                               context.push('${NameRoutes.storeScreen}/$index');
//                             },
//                             navigateStoresTitle: () {
//                               context.push('${NameRoutes.storeScreen}/$index');
//                             },
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 );
//             }
//           },
//         ),
//       ),
//     );
//   }
