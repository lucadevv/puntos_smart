import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/domain/entities/response/module/survey_response_entity.dart';

class CustomItemAnswerWidget extends StatelessWidget {
  const CustomItemAnswerWidget({
    super.key,
    required this.surveryResponseEntity,
  });

  final SurveryResponseEntity surveryResponseEntity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 175,
      margin: const EdgeInsets.only(
        left: 6,
        right: 0,
        top: 10,
        bottom: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), //12
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.greymedium.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: surveryResponseEntity.imagen,
                width: 260,
                height: 106,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const Spacer(),
          Text(
            surveryResponseEntity.titulo,
            style: textTheme.bodySmall!.copyWith(
              color: Colors.black54,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 4),
          Text(
            surveryResponseEntity.descripcion,
            style: textTheme.bodySmall!.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 2),
          Text(
            'Gana ${surveryResponseEntity.puntos} PS',
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
