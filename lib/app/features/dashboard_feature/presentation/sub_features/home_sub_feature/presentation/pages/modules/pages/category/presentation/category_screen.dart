import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_carrd_product.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/slivers/sliver_search_widget.dart';

class CateogryScreen extends StatelessWidget {
  const CateogryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.unfocus();
        }
      },
      child: PopScope(
        onPopInvoked: (didPop) {
          context.go("${NameRoutes.homeScreen}/${NameRoutes.moduleScreen}");
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Text(
                  'Comida',
                  style: textTheme.bodyLarge!.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                leadingWidth: 70,
                leading: const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 4),
                  child: CustomButtonArrowBack(),
                ),
              ),
              SliverSearchWidget(
                  showBackIcon: false, safeAreaTop: 0, focusNode: FocusNode()),
              SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(bottom: 12),
                    child: CustomCardProductWidget(
                      index: index,
                      onTap: () {
                        context.push(
                          "${NameRoutes.homeScreen}/${NameRoutes.moduleScreen}/${NameRoutes.categorysScreen}/${NameRoutes.productDetailScreen}/$index",
                          extra: {'fromCategory': true},
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
