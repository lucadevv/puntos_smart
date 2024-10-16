import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/coupon_store/presentation/widgets/coupon_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/product_detail/presentation/slivers/sliver_appbar_product.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/product_detail/presentation/slivers/sliver_header_product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppbarProductWidget(),
          const SliverHeaderWidget(),
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (contex, index) {
              return GestureDetector(
                onTap: () {
                  context.push(
                      '${NameRoutes.couponsScreen}/1/$index'); // Donde '1' es el idTienda y '2' es el idCoupon
                },
                child: CouponWidget(
                  index: index,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
