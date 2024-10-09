import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_answer_widget.dart';

class WinPointsModuleWidget extends StatelessWidget {
  const WinPointsModuleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: AppColors.greyligth,
        //     width: 1,
        //   ),
        // ),
        //color: Colors.amber,
        height: 260, //250
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: () {
                  context.push('${NameRoutes.answerWinDetailScreen}/$index');
                },
                child: const CustomItemAnswerWidget(),
              ),
            );
          },
        ),
      ),
    );
  }
}
