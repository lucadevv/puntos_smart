import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/persisten_header_delegate.dart';

class SliverHeaderWidget extends StatelessWidget {
  const SliverHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverPersistentHeader(
      pinned: true, // Asegura que el header se mantenga fijo al hacer scroll
      delegate: MySliverPersistentHeaderDelegate(
        minHeight: 400, // Altura mínima cuando se colapsa
        maxHeight: 400, // Altura máxima cuando está expandido
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hamburguesa',
                    style: textTheme.titleMedium!.copyWith(
                      color: AppColors.blacknew,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  //const CustomPunctationWidget(color: Colors.black),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Doble Cuarto de Libra con Queso',
                style: textTheme.titleLarge!.copyWith(
                  color: AppColors.blacknew,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              Text(
                's/.22.90',
                style: textTheme.titleMedium!.copyWith(
                  color: AppColors.greymedium,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.greymedium,
                ),
              ),
              Text(
                's/.22.90',
                style: textTheme.titleLarge!.copyWith(
                  color: AppColors.blacknew,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              // Text(
              //   productDescription,
              //   style: textTheme.bodyLarge!.copyWith(
              //     color: AppColors.descriptionColor,
              //     fontWeight: FontWeight.normal,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              //   maxLines: 10,
              // ),
              SizedBox(
                height: 115, // Define una altura máxima visible para el texto
                child: SingleChildScrollView(
                  child: Text(
                    productDescription,
                    style: textTheme.bodyLarge!.copyWith(
                      color: AppColors.greymedium,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Canjea tu cupón smart',
                style: textTheme.headlineSmall!.copyWith(
                  color: AppColors.blacknew,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const String productDescription =
    '¿Qué es lo que hace al Big Mac único? Quizás sean las dos hamburguesas de pura carne con la salsa secreta especial y el queso derretido, el toque de cebolla y el crocante del pepino. Bueno, en realidad quizás sea solo que es el más alto...';
