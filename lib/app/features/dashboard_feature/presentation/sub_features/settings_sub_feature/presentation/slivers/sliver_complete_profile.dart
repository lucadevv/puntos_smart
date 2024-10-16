import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/extension/custom_extension.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SliverCompleteProfile extends StatelessWidget {
  const SliverCompleteProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 120,
          width: size.width,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 1,
              color: Colors.grey.shade400,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Completa tu perfil - 0 de 4",
                style: textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              2.hSpace,
              Text(
                "Selecciona tu fecha de nacimiento y género",
                style: textTheme.bodySmall!.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 20,
                width: size.width,
                child: Row(
                  children: List.generate(
                    4,
                    (index) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: index != 3 ? 8 : 0),
                          child: LinearProgressIndicator(
                            value: 0.5,
                            color: AppColors.onPrimary,
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Completar",
                style: textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                  decorationThickness: 1.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
