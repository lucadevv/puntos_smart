import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/features/coupon_feature/presentation/painters/coupon_painter.dart';

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
          Positioned(
            left: 20,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.6,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Descuento en la compra de la segunda hamburguesa',
                          style: textTheme.titleSmall!.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'display',
                            letterSpacing: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '45 PS',
                          style: textTheme.displayMedium!.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'display',
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '15/10/2024 hasta 28/10/2024',
                      style: textTheme.titleSmall!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'display',
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.right,
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
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'display',
                      ),
                    ),
                    TextSpan(
                      text: 'Descuento', // Parte del texto con un estilo
                      style: textTheme.titleLarge!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'display',
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
