import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/home_bloc.dart';

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
              return Container(
                height: 180,
                width: size.width,
                padding: const EdgeInsets.only(left: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, idx) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 650 + ((idx) * 250)),
                      transform: Matrix4.translationValues(
                          myAnimationLoading ? 0 : -560, 0, 0),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: 260,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: AppColors.descriptionColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),
              );

            case BannersStatus.success:
              return Container(
                height: 180,
                width: size.width,
                padding: const EdgeInsets.only(left: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: bannerList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, idx) {
                    final item = bannerList[idx];
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
