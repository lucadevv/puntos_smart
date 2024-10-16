import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/coupon_store/presentation/slivers/sliver_appbar_coupon.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/coupon_store/presentation/widgets/coupon_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/slivers/sliver_search_widget.dart';

class CouponsScreen extends StatefulWidget {
  final String id;
  const CouponsScreen({super.key, required this.id});

  @override
  State<CouponsScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponsScreen> {
  late ScrollController scrollController;
  bool _showBackIcon = false;
  final double _sliverAppBarHeight = 350.0;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            300.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      }
    });

    super.initState();
  }

  void _scrollListener() {
    if (scrollController.hasClients) {
      double scrollPosition = scrollController.offset;

      // Detectar cuando el SliverAppBar está completamente fuera de la pantalla
      if (scrollPosition >= _sliverAppBarHeight && !_showBackIcon) {
        setState(() {
          _showBackIcon = true; // Actualizar el estado a oculto
        });
      } else if (scrollPosition < _sliverAppBarHeight && _showBackIcon) {
        setState(() {
          _showBackIcon = false; // El AppBar vuelve a ser visible
        });
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double safeAreaTop = MediaQuery.of(context).padding.top;

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
          controller: scrollController,
          slivers: [
            SliverAppbarCouponWidget(sliverAppBarHeight: _sliverAppBarHeight),
            SliverSearchWidget(
              showBackIcon: _showBackIcon,
              safeAreaTop: safeAreaTop,
              focusNode: _focusNode,
            ),
            SliverList.builder(
              itemCount: 2,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    context.push('${NameRoutes.couponsScreen}/1/$index');
                  },
                  child: CouponWidget(
                    index: index,
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
