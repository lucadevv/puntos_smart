import 'package:flutter/material.dart';

class CouponPainterV extends CustomPainter {
  final Color color;

  CouponPainterV({super.repaint, required this.color});
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
    path.lineTo(x - borderRadius, 0);
    path.quadraticBezierTo(x, 0, x, borderRadius);
    path.lineTo(x, y * 0.15);

    path.arcToPoint(
      Offset(x, y * 0.2), // Punto donde termina el semicírculo
      radius: const Radius.circular(0.5), // Radio del semicírculo
      clockwise: false, // Semicírculo en sentido antihorario
    );
    path.lineTo(x, y - borderRadius);
    path.quadraticBezierTo(x, y, x - borderRadius, y);
    path.lineTo(0 + borderRadius, y);
    path.quadraticBezierTo(0, y, 0, y - borderRadius);
    path.lineTo(0, y * 0.2);

    path.arcToPoint(
      Offset(0, y * 0.15), // Punto donde termina el semicírculo
      radius: const Radius.circular(0.5), // Radio del semicírculo
      clockwise: false, // Semicírculo en sentido antihorario
    );
    path.lineTo(0, 0 + borderRadius);
    path.quadraticBezierTo(0, 0, 0 + borderRadius, 0);
    canvas.drawPath(path, paint);

    double dashWidth = 7.0;
    double dashSpace = 3.0;

    double startX = 0;
    final double endX = x - 10;

    double yPosition = y * 0.175;

    while (startX < endX) {
      path3.moveTo(startX, yPosition);
      path3.lineTo(startX + dashWidth, yPosition);

      startX += dashWidth + dashSpace;
    }

    canvas.drawPath(path3, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
