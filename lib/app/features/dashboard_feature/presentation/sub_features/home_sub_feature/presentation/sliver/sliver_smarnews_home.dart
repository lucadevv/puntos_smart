import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_ontap.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_shimer.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/home/news_entity.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/home_bloc/home_bloc.dart';
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
    final textTheme = Theme.of(context).textTheme;
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
                height: 106,
                width: size.width,
                padding: const EdgeInsets.only(left: 13),
                child: CarouselSlider.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index, realInde) {
                    final item = newsList[index];
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 650 + ((index) * 250)),
                      transform: Matrix4.translationValues(
                          myAnimationSuccess ? 0 : -560, 0, 0),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: 260,
                        height: 100,
                        margin: const EdgeInsets.only(
                            right: 12, left: 3, top: 3, bottom: 3),
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
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl: item.imagen2,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.titulo,
                                          style: textTheme.bodyMedium!.copyWith(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          item.notaCorta,
                                          style: textTheme.labelSmall!.copyWith(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CustomOnTap(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ShowDialogWidget(
                                          size: size, item: item);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 0.8,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    disableCenter: true,
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

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget({
    super.key,
    required this.size,
    required this.item,
  });

  final Size size;
  final NewsEntity item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final images = [item.imagen1, item.imagen2];
    return Dialog(
      child: SizedBox(
        height: size.height * 0.5,
        width: size.width * 0.8,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final image = images[index];
                  return CachedNetworkImage(
                    imageUrl: image,
                    height: size.height * 0.5,
                    width: size.width * 0.8,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  disableCenter: true,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Container(
                height: size.height * 0.3,
                width: size.width * 0.8,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.6, 0.9],
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.titulo,
                      style: textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      item.descripcion,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const noImage =
    "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg";
