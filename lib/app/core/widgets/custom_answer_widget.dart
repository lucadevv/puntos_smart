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
      margin: const EdgeInsets.only(
        right: 0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.surface,
                width: 2,
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
