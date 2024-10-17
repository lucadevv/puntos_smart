import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_answer_widget.dart';

class WinPointsModuleWidget extends StatelessWidget {
  const WinPointsModuleWidget({
    super.key,
    this.indexAnimation = 1,
  });

  final int? indexAnimation;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 260,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, idx) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: () {
                  context.push(
                    '${NameRoutes.homeScreen}/${NameRoutes.moduleScreen}/${NameRoutes.answerWinDetailScreen}/$idx',
                    extra: {'fromModule': true},
                  );
                },
                child: CustomItemAnswerWidget(
                  index: idx,
                  indexAnimation: indexAnimation,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
