import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/extension/custom_extension.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';

import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/widgets/custom_arrow_back.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _page = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _page);
    super.initState();
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
                    backgroundColor: Colors.white,
                    // leading: InkWell(
                    //   onTap: () {
                    //     context.pop();
                    //   },
                    //   child: const Icon(
                    //     Icons.arrow_back_ios_new,
                    //     color: Colors.black54,
                    //   ),
                    // ),
                    leadingWidth: 70,
                    leading: const Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 4),
                      child: CustomButtonArrowBack(),
                    ),
                    centerTitle: true,
                    title: Text(
                      AppText.myFavorities,
                      style: textTheme.bodyLarge!.copyWith(
                        color: AppColors.blacknew,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 16, vertical: 12),
                  //     child: Text(
                  //       AppText.myFavorities,
                  //       style: textTheme.titleLarge!.copyWith(
                  //         color: Colors.black87,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                                            ? Colors.black87
                                            : Colors.black54,
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
                                            ? Colors.black87
                                            : Colors.black54,
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
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (value) {
                          _selectedPage(value);
                        },
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppText.emptyStoreTtitle,
                                  style: textTheme.titleLarge!.copyWith(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                12.hSpace,
                                Text(
                                  AppText.emptyStoreSubtitle,
                                  style: textTheme.titleSmall!.copyWith(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppText.emptyProductsTitle,
                                  style: textTheme.titleLarge!.copyWith(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                12.hSpace,
                                Text(
                                  AppText.emptyProductsSubtitle,
                                  style: textTheme.titleSmall!.copyWith(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: kToolbarHeight * 0.5,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButtonWidget(
                  title: _page == 0 ? "Buscar tiendas" : "Buscar productos",
                  width: size.width,
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdressEditModal extends StatelessWidget {
  const AdressEditModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 4,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          16.hSpace,
          Divider(
            color: Colors.grey.shade200,
          ),
          16.hSpace,
          ListTile(
            leading: const Icon(
              Iconsax.edit,
              color: Colors.grey,
            ),
            title: Text(
              "Editar dirección",
              style: textTheme.bodySmall!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Iconsax.trash,
              color: Colors.redAccent,
            ),
            title: Text(
              "Eliminar dirección",
              style: textTheme.bodySmall!.copyWith(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
