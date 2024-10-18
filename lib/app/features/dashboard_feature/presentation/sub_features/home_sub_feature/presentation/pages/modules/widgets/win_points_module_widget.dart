import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_answer_widget.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_shimer.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/module_bloc/module_bloc.dart';
import 'package:shimmer/shimmer.dart';

class WinPointsModuleWidget extends StatefulWidget {
  const WinPointsModuleWidget({
    super.key,
    this.indexAnimation = 1,
  });

  final int? indexAnimation;

  @override
  State<WinPointsModuleWidget> createState() => _WinPointsModuleWidgetState();
}

class _WinPointsModuleWidgetState extends State<WinPointsModuleWidget> {
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
        height: 260,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ModuleBloc, ModuleState>(
          builder: (context, state) {
            final listSurver = state.listSurvey;
            switch (state.surveysStatus) {
              case SurveysStatus.loading:
                return ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
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
                          padding: EdgeInsets.only(
                              right: 12, left: 6, bottom: 10, top: 10),
                          child: CustomShimer(
                            width: 175,
                            heigh: 110,
                            borderRadius: 16,
                          ),
                        ),
                      ),
                    );
                  },
                );

              case SurveysStatus.success:
                return ListView.builder(
                  itemCount: listSurver.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, idx) {
                    final item = listSurver[idx];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: InkWell(
                        onTap: () {
                          // context.push(
                          //   '${NameRoutes.homeScreen}/${NameRoutes.moduleScreen}/${NameRoutes.answerWinDetailScreen}/$idx',
                          //   extra: {'fromModule': true},
                          // );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 650 + ((idx) * 250)),
                          transform: Matrix4.translationValues(
                              myAnimationSuccess ? 0 : -560, 0, 0),
                          curve: Curves.easeInOut,
                          child: CustomItemAnswerWidget(
                            surveryResponseEntity: item,
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
      ),
    );
  }
}


//  return Padding(
//                       padding: const EdgeInsets.only(right: 12),
//                       child: InkWell(
//                         onTap: () {
//                           // context.push(
//                           //   '${NameRoutes.homeScreen}/${NameRoutes.moduleScreen}/${NameRoutes.answerWinDetailScreen}/$idx',
//                           //   extra: {'fromModule': true},
//                           // );
//                         },
//                         child: CustomItemAnswerWidget(
//                           index: idx,
//                           indexAnimation: widget.indexAnimation,
//                         ),
//                       ),
//                     );