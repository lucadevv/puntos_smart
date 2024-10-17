import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_shimer.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SliverBannersHomeWidget extends StatefulWidget {
  const SliverBannersHomeWidget({
    super.key,
  });

  @override
  State<SliverBannersHomeWidget> createState() =>
      _SliverBannersHomeWidgetState();
}

class _SliverBannersHomeWidgetState extends State<SliverBannersHomeWidget> {
  bool myAnimationLoading = false;
  bool myAnimationSuccess = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((time) {
      setState(() {
        myAnimationLoading = true;
        myAnimationSuccess = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final bannerList = state.bannerList;
          switch (state.bannersStatus) {
            case BannersStatus.loading:
              return SizedBox(
                height: 180,
                width: size.width,
                child: CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return AnimatedContainer(
                      duration:
                          Duration(milliseconds: 650 + ((itemIndex) * 250)),
                      transform: Matrix4.translationValues(
                          myAnimationSuccess ? 0 : -560, 0, 0),
                      curve: Curves.easeInOut,
                      child: Shimmer.fromColors(
                        baseColor: AppColors.baseShimmer,
                        highlightColor: AppColors.highlightShimmer,
                        child: const CustomShimer(
                          width: double.infinity,
                          heigh: 180,
                          borderRadius: 16,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 0.7,
                    autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                ),
              );

            case BannersStatus.success:
              return SizedBox(
                height: 180,
                width: size.width,
                child: CarouselSlider.builder(
                  itemCount: bannerList.length, //bannerList.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    final item = bannerList[itemIndex];
                    return AnimatedContainer(
                      duration:
                          Duration(milliseconds: 650 + ((itemIndex) * 250)),
                      transform: Matrix4.translationValues(
                          myAnimationSuccess ? 0 : -560, 0, 0),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: size.width,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: item.imagen1,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 0.7,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
              );

            default:
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
