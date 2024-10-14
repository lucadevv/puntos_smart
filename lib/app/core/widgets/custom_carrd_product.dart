import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_image_logo_store_widget.dart';

class CustomCardProductWidget extends StatelessWidget {
  const CustomCardProductWidget({
    super.key,
    required this.index,
    this.isDiscound = true,
  });
  final int index;
  final bool? isDiscound;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        context.push('${NameRoutes.productDetailScreen}/$index');
      },
      child: Container(
        height: 250, //250
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(
          //   color: AppColors.textfield,
          //   width: 2,
          // ),
          boxShadow: [
            BoxShadow(
              color: AppColors.greynew
                  .withOpacity(0.2), // Color de la sombra con opacidad
              spreadRadius: 1, // Extensión de la sombra
              blurRadius: 8, // Desenfoque de la sombra
              offset: const Offset(0, 4), // Desplazamiento de la sombra (x, y)
            ),
          ],
        ),

        child: Column(
          children: [
            SizedBox(
              height: 163, //163
              child: Stack(
                children: [
                  Container(
                    height: 163, //163
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.5),
                        topRight: Radius.circular(12.5),
                      ),
                    ),
                  ),
                  //
                  if (isDiscound == true)
                    Align(
                      //Positioned
                      //top: 10, // Ajusta la posición vertical
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: 40,
                          width: screenWidth * 0.65,
                          decoration: BoxDecoration(
                            color: AppColors.blacknew,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              'Hay descuento, algo de texto, prueba algo mas, mas texto ',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Colors.white, // Color del texto
                                    fontWeight: FontWeight.bold,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),

                  // CANTIDAD DE ESTRELLAS POR PRODUCTO
                  // const Positioned(
                  //   bottom: 16,
                  //   right: 16,
                  //   child: CustomPunctationWidget(color: Colors.black),
                  // ),
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
                            color: AppColors.blacknew,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          'Hamburguesa de carne 100% de res con queso doble queso cheddar, cebolla ...',
                          style: textTheme.labelSmall!.copyWith(
                            color: AppColors.blacknew,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                          ),
                          maxLines: 2,
                        ),
                        Text(
                          'Descuento valido en tienda fisica',
                          style: textTheme.labelSmall!.copyWith(
                            color: AppColors.greymedium,
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
