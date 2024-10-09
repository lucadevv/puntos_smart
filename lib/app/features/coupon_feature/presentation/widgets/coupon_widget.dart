import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/features/coupon_feature/presentation/painters/coupon_painter.dart';

import '../../../../core/theme/app_colors.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 170,
      margin: const EdgeInsets.only(bottom: 16, top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.08),
                  blurRadius: 2,
                  spreadRadius: 2,
                )
              ],
              border: Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomPaint(
              size: const Size(double.infinity, 150),
              painter: CouponPainter(
                color: Colors.primaries[index].withOpacity(0.7),
              ),
            ),
          ),
          // Positioned(
          //   left: 20,
          //   child: Container(
          //     height: 100,
          //     width: MediaQuery.of(context).size.width * 0.6,
          //     alignment: Alignment.center,
          //     child: Row(
          //       children: [
          //         Expanded(
          //           flex: 7, // 70% del ancho para el texto
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'Titulo Descuento en la compra de la segunda hamburguesa',
          //                 style: textTheme.titleSmall!.copyWith(
          //                   color: Colors.black54,
          //                   fontWeight: FontWeight.bold,
          //                   fontFamily: 'onset',
          //                   letterSpacing: 1,
          //                   overflow: TextOverflow.ellipsis,
          //                   height: 1.1,
          //                 ),
          //                 maxLines: 2,
          //               ),
          //               Text(
          //                 'Descripcion Descuento en la compra de la segunda hamburguesa',
          //                 style: textTheme.labelMedium!.copyWith(
          //                   color: Colors.black54,
          //                   fontWeight: FontWeight.bold,
          //                   fontFamily: 'onset',
          //                   letterSpacing: 1,
          //                   overflow: TextOverflow.ellipsis,
          //                   height: 1.1,
          //                 ),
          //                 maxLines: 2,
          //               ),
          //             ],
          //           ),
          //         ),
          //         Flexible(
          //           flex: 3, // 30% del ancho para la imagen
          //           child: Container(
          //             width: double
          //                 .infinity, // Ocupa todo el espacio disponible (30% del ancho)
          //             height: 80,
          //             decoration: BoxDecoration(
          //               shape: BoxShape
          //                   .circle, // Hace que el contenedor sea circular
          //               image: DecorationImage(
          //                 image: AssetImage(
          //                     'assets/images/hamburguesa2.jpg'), // Reemplaza con la ruta de tu imagen
          //                 fit: BoxFit
          //                     .cover, // Ajusta la imagen para cubrir el contenedor
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Positioned(
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                children: [
                  Container(
                    //height: 100,
                    //color: AppColors.arrowbacButtonColor,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7, // 70% del ancho para el texto
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Titulo Descuento en la compra de la segunda hamburguesa',
                                style: textTheme.titleSmall!.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'onset',
                                  letterSpacing: 1,
                                  overflow: TextOverflow.ellipsis,
                                  height: 1.1,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                              ),
                              Text(
                                'Descripcion Descuento en la compra de la segunda hamburguesa',
                                style: textTheme.labelMedium!.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'onset',
                                  letterSpacing: 1,
                                  overflow: TextOverflow.ellipsis,
                                  height: 1.1,
                                ),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 3, // 30% del ancho para la imagen
                          child: Container(
                            width: double
                                .infinity, // Ocupa todo el espacio disponible (30% del ancho)
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape
                                  .circle, // Hace que el contenedor sea circular
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/hamburguesa2.jpg'), // Reemplaza con la ruta de tu imagen
                                fit: BoxFit
                                    .cover, // Ajusta la imagen para cubrir el contenedor
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  // Nuevo contenedor para fecha y precio
                  Container(
                    width: double
                        .infinity, // Ocupa el 100% del ancho del contenedor
                    child: Text(
                      '45PS',
                      style: textTheme.titleLarge!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        letterSpacing: 1,
                        overflow: TextOverflow.ellipsis,
                        height: 1.1,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: double
                        .infinity, // Ocupa el 100% del ancho del contenedor
                    child: Text(
                      'Valido de 15/10/2024 hasta 28/10/2024',
                      style: textTheme.titleSmall!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        overflow: TextOverflow.ellipsis,
                        height: 1.1,
                        fontSize: 10,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            right: 0,
            child: Transform.rotate(
              angle: math.pi / -2,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '35 % \n', // Parte del texto con un estilo
                      style: textTheme.titleLarge!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                      ),
                    ),
                    TextSpan(
                      text: 'Descuento', // Parte del texto con un estilo
                      style: textTheme.titleLarge!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'onest',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// const SizedBox(height: 6),
// Text(
//   '45 PS',
//   style: textTheme.titleMedium!.copyWith(
//     color: Colors.black87,
//     fontWeight: FontWeight.w900,
//     fontFamily: 'onest',
//     letterSpacing: 2,
//   ),
// ),
// const SizedBox(height: 4),
// Text(
//   '15/10/2024 hasta 28/10/2024',
//   style: textTheme.labelSmall!.copyWith(
//     color: Colors.black54,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'onest',
//     letterSpacing: 1,
//   ),
//   textAlign: TextAlign.right,
// ),
