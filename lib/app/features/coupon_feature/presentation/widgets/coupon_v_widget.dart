import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/coupon_feature/presentation/painters/coupon_painter_v.dart';
import '../../../../core/theme/app_colors.dart';

class CouponPainterVerticalWidget extends StatelessWidget {
  const CouponPainterVerticalWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.height * 0.9,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ],
              border: Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
            ),
          ),
          CustomPaint(
            size: Size(
              size.width * 0.8 - 20,
              size.height * 0.9 - 20,
            ),
            painter: CouponPainterV(
              color: Colors.primaries[index].withOpacity(0.7),
            ),
          ),
          SizedBox(
            height: size.height * 0.9 - 20,
            width: size.width * 0.8 - 20,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '35 % \n', // Parte del texto con un estilo
                            style: textTheme.displayMedium!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                            ),
                          ),
                          TextSpan(
                            text: 'Descuento', // Parte del texto con un estilo
                            style: textTheme.displayMedium!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Descuento en la compra de la segunda hamburguesa', // Parte del texto con un estilo
                          style: textTheme.displaySmall!.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            height: 1.1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 150,
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              Expanded(
                                flex: 5,
                                child: BarcodeWidget(
                                  barcode: Barcode
                                      .code128(), // Barcode type and settings
                                  data: '4534FD43', // Content
                                  width: 200,
                                  //height: 10,
                                  drawText: false,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Expanded(
                                flex: 3, // 30% del espacio para el texto
                                child: Center(
                                  child: Text(
                                    '4534FD43',
                                    style: textTheme.displaySmall!.copyWith(
                                      // fontSize: 32,
                                      color: Colors.primaries[index],
                                      fontFamily: 'poppins',
                                      letterSpacing: 5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 150,
                          child: SingleChildScrollView(
                            child: Text(
                              terminos,
                              style: textTheme.labelSmall!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                //fontFamily: 'display',
                                color: AppColors.primary,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 20,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text(
                              '45 PS',
                              style: textTheme.displaySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins',
                                color: AppColors.primary,
                                //fontSize: 32,
                              ),
                            ),
                            const Spacer(),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  context.push(
                                      '${NameRoutes.rateStoreScreen}/$index');
                                },
                                child: Container(
                                  height: 50,
                                  width: 110,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Comprar',
                                    style: textTheme.displaySmall!.copyWith(
                                      color: Colors.primaries[index],
                                      //fontFamily: 'display',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const terminos =
    'Términos y Condiciones del Cupón: Este cupón es válido desde el [fecha de inicio] hasta el [fecha de vencimiento]. Después de esta fecha, el cupón será inválido y no podrá ser utilizado. El cupón es aplicable únicamente para compras realizadas en [nombre de la tienda o plataforma] y solo puede ser utilizado una vez por persona. Otorga un [porcentaje de descuento] de descuento sobre el total de la compra o [cantidad específica de dinero] de descuento. No aplica a productos ya en oferta o promociones especiales. El cupón no es válido para la compra de [productos excluidos, si los hay] y no se puede combinar con otros .........';
