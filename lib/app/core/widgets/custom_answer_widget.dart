import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class CustomItemAnswerWidget extends StatelessWidget {
  const CustomItemAnswerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 175,
      //height: 250,
      margin: const EdgeInsets.only(
        right: 0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), //12
      decoration: BoxDecoration(
        color: AppColors.primary, //AppColors.surface.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.greymedium
                .withOpacity(0.2), // Color de la sombra con opacidad
            spreadRadius: 1, // Extensión de la sombra
            blurRadius: 8, // Desenfoque de la sombra
            offset: Offset(0, 4), // Desplazamiento de la sombra (x, y)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 120,
            width: 120,
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
              color: Colors.black54,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 4),
          Text(
            'Titulo de la Encuesta, maximo tres lineas y longitud',
            style: textTheme.bodySmall!.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 2),
          Text(
            'Gana 20 PS',
            style: textTheme.bodySmall!.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.end,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
