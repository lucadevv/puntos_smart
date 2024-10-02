import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_image_logo_store_widget.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_punctation_widget.dart';

class CustomCardProductWidget extends StatelessWidget {
  const CustomCardProductWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        context.push('${NameRoutes.productDetailScreen}/$index');
      },
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.surface,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 163,
              child: Stack(
                children: [
                  Container(
                    height: 163,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.5),
                        topRight: Radius.circular(12.5),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 16,
                    right: 16,
                    child: CustomPunctationWidget(color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  const CustomImageLogoStoreWidget(
                    height: 55,
                    width: 55,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Doble Cuarto de Libra con Queso',
                          style: textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Hamburguesa de carne 100% de res con queso doble queso cheddar, cebolla ...',
                          style: textTheme.labelSmall!.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                          ),
                          maxLines: 2,
                        ),
                        Text(
                          'Descuento valido en tienda fisica',
                          style: textTheme.labelSmall!.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
