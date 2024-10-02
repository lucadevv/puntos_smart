import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/features/coupon_feature/presentation/widgets/coupon_v_widget.dart';

class CounponScreen extends StatelessWidget {
  final String idTienda;
  final String idCoupon;
  const CounponScreen({
    super.key,
    required this.idTienda,
    required this.idCoupon,
  });

  @override
  Widget build(BuildContext context) {
    return CouponPainterVerticalWidget(
      index: int.parse(idCoupon),
    );
  }
}
