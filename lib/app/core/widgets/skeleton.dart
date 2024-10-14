import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/coupon_feature/presentation/painters/coupon_painter.dart';
import '../theme/app_colors.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    this.height = 20.0,
    this.width,
    this.radius = 15.0,
  }) : super(key: key);

  final double height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[200]!, //Colors.grey[300]!
        highlightColor: Colors.grey[100]!, //Colors.grey[200]!
        child: Container(
          height: height,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300]!,
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 15.0)),
          ),
        ));
  }
}

class Card_Skeleton extends StatelessWidget {
  const Card_Skeleton({
    Key? key,
    this.height = 20.0,
    this.width,
    //this.radius = 15.0,
  }) : super(key: key);

  final double height;
  final double? width;
  //final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200]!,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.5),
              topRight: Radius.circular(12.5),
            ),
          ),
        ));
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}

class SqueareSkeleton extends StatelessWidget {
  const SqueareSkeleton({
    Key? key,
    this.height = 20,
    this.width = 20,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[200]!, //Colors.grey[300]!
        highlightColor: Colors.grey[100]!, //Colors.grey[200]!
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey[300]!,
          ),
          margin: const EdgeInsets.only(bottom: 16),
        ));
  }
}

//  = = = = = = = = PLANTILLAS SKELETON TIENDAS / ITEMS / CUPONES
class tiendas_skeleton extends StatelessWidget {
  const tiendas_skeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(color: AppColors.greyligth),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Cuadrado de 80x80 para simular una imagen o avatar
          Skeleton(
            height: 80,
            width: 80,
            radius: 12.0, // Bordes redondeados en el cuadrado
          ),
          SizedBox(width: 10), // Espacio entre el cuadrado y los textos

          // Column para simular las líneas de texto
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Skeleton(
                  height: 14,
                  width: double.infinity, // Línea larga
                  radius: 8.0,
                ),
                SizedBox(height: 8),
                Skeleton(
                  height: 12,
                  width: 200, // Línea más corta
                  radius: 8.0,
                ),
                SizedBox(height: 8),
                Skeleton(
                  height: 12,
                  width: 150, // Línea más corta
                  radius: 8.0,
                ),
                SizedBox(height: 8),
                Skeleton(
                  height: 12,
                  width: 100, // Línea más corta
                  radius: 8.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class items_skeleton extends StatelessWidget {
  const items_skeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(color: AppColors.greyligth),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      //padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: const Column(
        children: [
          SizedBox(
            height: 163, //163
            child: Stack(
              children: [
                Card_Skeleton(
                  height: 163,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Skeleton(
                  height: 55,
                  width: 55,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(
                        height: 16,
                        width: double.infinity,
                        radius: 8.0,
                      ),
                      SizedBox(height: 5),
                      Skeleton(
                        height: 12,
                        width: 250,
                        radius: 8.0,
                      ),
                      SizedBox(height: 5),
                      Skeleton(
                        height: 12,
                        width: 200,
                        radius: 8.0,
                      ),
                      // SizedBox(height: 5),
                      // Skeleton(
                      //   height: 12,
                      //   width: 150,
                      //   radius: 8.0,
                      // ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class coupon_skeleton extends StatelessWidget {
  const coupon_skeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      //margin: const EdgeInsets.only(bottom: 16, top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primary,
              border: Border.all(color: AppColors.greyligth),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              child: CustomPaint(
                size: const Size(double.infinity, 150),
                painter: CouponPainter2(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CouponPainter2 extends CustomPainter {
  final Color color;

  CouponPainter2({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;
    var paint2 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;
    final x = size.width;
    final y = size.height;

    var path = Path();
    var path3 = Path();
    double borderRadius = 10;

    path.moveTo(borderRadius, 0);
    path.lineTo((x * 0.7), 0);

    path.arcToPoint(
      Offset(x * 0.8, 0), // Punto donde termina el semicírculo
      radius: const Radius.circular(0.5), // Radio del semicírculo
      clockwise: false, // Semicírculo en sentido antihorario
    );

    path.lineTo(x - borderRadius, 0);
    path.quadraticBezierTo(x, 0, x, borderRadius);
    path.lineTo(x, y - borderRadius);
    path.quadraticBezierTo(x, y, x - borderRadius, y);
    path.lineTo(x - (x * 0.2), y);
    path.arcToPoint(
      Offset(x - (x * 0.3), y), // Punto donde termina el semicírculo
      radius: const Radius.circular(1), // Radio del semicírculo
      clockwise: false, // Semicírculo en sentido antihorario
    );
    path.lineTo(0 + borderRadius, y);
    path.quadraticBezierTo(0, y, 0, y - borderRadius);
    path.lineTo(0, 0 + borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);

    canvas.drawPath(path, paint);

    double dashWidth = 7.0;
    double dashSpace = 3.0;

    // Dibujar línea vertical punteada a partir del final de la línea horizontal
    double startY = 15;
    final double endY = size.height - 15;
    double startXVertical = size.width * 0.75;

    while (startY < endY) {
      path3.moveTo(startXVertical, startY);
      path3.lineTo(startXVertical, startY + dashWidth);
      startY += dashWidth + dashSpace;
    }

    canvas.drawPath(path3, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class encuestas_skeleton extends StatelessWidget {
  const encuestas_skeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(color: AppColors.greyligth),
      ),
      //margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Skeleton(
            height: 110,
            radius: 12.0,
          ),
          SizedBox(
            // width: 5,
            height: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinea las líneas a la izquierda
              children: [
                Skeleton(
                  height: 14,
                  width: double.infinity, // Línea larga
                  radius: 8.0,
                ),
                SizedBox(height: 5),
                Skeleton(
                  height: 12,
                  width: 70, // Línea más corta
                  radius: 8.0,
                ),
                SizedBox(height: 5),
                Skeleton(
                  height: 12,
                  width: 50, // Línea más corta
                  radius: 8.0,
                ),
                SizedBox(height: 5),
                Skeleton(
                  height: 12,
                  width: 60, // Línea más corta
                  radius: 8.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class store_view extends StatelessWidget {
  const store_view({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, // Ocupa todo el ancho
      // padding: const EdgeInsets.all(
      //     16.0), // Padding para el contenido interno
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alineación de los elementos
        children: [
          SqueareSkeleton(
            height: 320,
            width: MediaQuery.of(context).size.width,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Skeleton(
              height: 20,
              //width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Skeleton(
              height: 20,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Skeleton(
              height: 20,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!, // Color base del shimmer
                highlightColor: Colors.white, // Color de destello
                child: SpinKitChasingDots(
                  color: Colors.grey[
                      300]!, // Color de los círculos (el mismo que el shimmer base)
                  size: 75.0, // Tamaño de los círculos
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
