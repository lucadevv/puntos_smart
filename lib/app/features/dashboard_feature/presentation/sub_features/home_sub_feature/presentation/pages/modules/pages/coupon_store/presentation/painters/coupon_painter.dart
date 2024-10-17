import 'package:flutter/material.dart';

class CouponPainter extends CustomPainter {
  final Color color;

  CouponPainter({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;
    var paint2 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
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
