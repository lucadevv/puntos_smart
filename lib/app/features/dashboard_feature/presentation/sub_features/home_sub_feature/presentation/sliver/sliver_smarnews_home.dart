import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_shimer.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/home_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SliverSmartNewHomeWidget extends StatefulWidget {
  const SliverSmartNewHomeWidget({
    super.key,
    this.index = 1,
  });

  final int? index;

  @override
  State<SliverSmartNewHomeWidget> createState() =>
      _SliverSmartNewHomeWidgetState();
}

class _SliverSmartNewHomeWidgetState extends State<SliverSmartNewHomeWidget> {
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
          final newsList = state.newsList;
          switch (state.newsStatus) {
            case NewsStatus.loading:
              return Container(
                height: 100,
                width: size.width,
                padding: const EdgeInsets.only(left: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, idx) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 650 + ((idx) * 250)),
                      transform: Matrix4.translationValues(
                          myAnimationLoading ? 0 : -560, 0, 0),
                      curve: Curves.easeInOut,
                      child: Shimmer.fromColors(
                        baseColor: AppColors.baseShimmer,
                        highlightColor: AppColors.highlightShimmer,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: CustomShimer(
                            width: 260,
                            heigh: 100,
                            borderRadius: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            case NewsStatus.success:
              return Container(
                height: 100,
                width: size.width,
                padding: const EdgeInsets.only(left: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, idx) {
                    final item = newsList[idx];
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 650 + ((idx) * 250)),
                      transform: Matrix4.translationValues(
                          myAnimationSuccess ? 0 : -560, 0, 0),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: 260,
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
