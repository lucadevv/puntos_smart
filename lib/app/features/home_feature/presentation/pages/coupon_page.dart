import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/coupon_feature/presentation/widgets/coupon_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/sliver_search_widget.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus
              .unfocus(); // Si quieres liberar el foco, puedes usar esta línea
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: AppColors.onPrimary,
              title: Text(
                AppText.myCouponSmart,
                style: textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SliverSearchWidget(
                showBackIcon: false, safeAreaTop: 0, focusNode: FocusNode()),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      context.push('${NameRoutes.couponsScreen}/1/$index');
                    },
                    child: CouponWidget(
                      index: index,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
