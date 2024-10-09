import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';

class AnswerWinScreen extends StatelessWidget {
  const AnswerWinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus
              .unfocus(); // Si quieres liberar el foco, puedes usar esta línea
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                AppText.answerAndWin,
                style: textTheme.bodyLarge!.copyWith(
                  color: AppColors.blacknew,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leadingWidth: 70,
              leading: const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 4),
                child: CustomButtonArrowBack(),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Tooltip(
                    enableFeedback: true,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    waitDuration: const Duration(seconds: 1),
                    message: AppText.infoAnswerAndWin,
                    textStyle: textTheme.labelSmall,
                    child: const Icon(
                      Iconsax.info_circle,
                      size: 25,
                      color: AppColors.onPrimary,
                    ),
                  ),
                )
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid.builder(
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1 / 1.3),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context
                          .push('${NameRoutes.answerWinDetailScreen}/$index');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12), //8
                      decoration: BoxDecoration(
                        color: AppColors
                            .primary, //AppColors.surface.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greynew.withOpacity(
                                0.2), // Color de la sombra con opacidad
                            spreadRadius: 1, // Extensión de la sombra
                            blurRadius: 8, // Desenfoque de la sombra
                            offset: const Offset(
                                0, 4), // Desplazamiento de la sombra (x, y)
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greyligth,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Hamburguesas',
                            style: textTheme.bodySmall!.copyWith(
                              color: AppColors.blacknew,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Titulo de la Encuesta, maximo tres lineas y longitud',
                            style: textTheme.bodySmall!.copyWith(
                              color: AppColors.blacknew,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Gana 20 PS',
                            style: textTheme.bodySmall!.copyWith(
                              color: AppColors.blacknew,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
