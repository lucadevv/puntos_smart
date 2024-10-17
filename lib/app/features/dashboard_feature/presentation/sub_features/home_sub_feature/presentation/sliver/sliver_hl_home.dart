import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_shimer.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/home_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SliverHighlightsSmartHomeWidget extends StatefulWidget {
  const SliverHighlightsSmartHomeWidget({
    super.key,
  });

  @override
  State<SliverHighlightsSmartHomeWidget> createState() =>
      _SliverHighlightsSmartHomeWidgetState();
}

class _SliverHighlightsSmartHomeWidgetState
    extends State<SliverHighlightsSmartHomeWidget> {
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
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final featuredList = state.featuredList;
          print(state.featuredStatus);
          switch (state.featuredStatus) {
            case FeaturedStatus.loading:
              return SliverList.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 650 + ((index) * 250)),
                    transform: Matrix4.translationValues(
                        myAnimationLoading ? 0 : -560, 0, 0),
                    curve: Curves.easeInOut,
                    child: Shimmer.fromColors(
                      baseColor: AppColors.baseShimmer,
                      highlightColor: AppColors.highlightShimmer,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: CustomShimer(
                          width: double.infinity,
                          heigh: 200,
                          borderRadius: 16,
                        ),
                      ),
                    ),
                  );
                },
              );
            case FeaturedStatus.success:
              return SliverList.builder(
                itemCount: featuredList.length,
                itemBuilder: (context, index) {
                  final item = featuredList[index];

                  return AnimatedContainer(
                    duration: Duration(milliseconds: 650 + ((index) * 250)),
                    transform: Matrix4.translationValues(
                        myAnimationSuccess ? 0 : -560, 0, 0),
                    curve: Curves.easeInOut,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: item.imagen1,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              );
            default:
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
