import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_ontap.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_shimer.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/module_bloc/module_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SmartTrendsModuleWidget extends StatefulWidget {
  const SmartTrendsModuleWidget({
    super.key,
  });

  @override
  State<SmartTrendsModuleWidget> createState() =>
      _SmartTrendsModuleWidgetState();
}

class _SmartTrendsModuleWidgetState extends State<SmartTrendsModuleWidget> {
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
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16),
        child: BlocBuilder<ModuleBloc, ModuleState>(
          builder: (context, state) {
            final listFlashPromotions = state.listFlashPromotions;
            switch (state.flashPromotionsStatus) {
              case FlashPromotionsStatus.loading:
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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
                            width: 260,
                            heigh: 110,
                            borderRadius: 16,
                          ),
                        ),
                      ),
                    );
                  },
                );
              case FlashPromotionsStatus.success:
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listFlashPromotions.length,
                  itemBuilder: (context, index) {
                    final item = listFlashPromotions[index];
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 650 + ((index) * 250)),
                      transform: Matrix4.translationValues(
                          myAnimationSuccess ? 0 : -560, 0, 0),
                      curve: Curves.easeInOut,
                      child: Container(
                        height: 106,
                        width: 260,
                        margin: const EdgeInsets.only(
                            right: 12, top: 2, bottom: 2, left: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.highlightShimmer,
                              spreadRadius: 1,
                              blurRadius: 2,
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: item.imagen1,
                                width: 260,
                                height: 106,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CustomOnTap(
                                onTap: () {},
                              ),
                            ),
                          ],
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
      ),
    );
  }
}
