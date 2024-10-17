import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/bloc/home_bloc.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/widgets/item_module_widget.dart';

class SliverModulesHomeWidget extends StatelessWidget {
  const SliverModulesHomeWidget({
    super.key,
    required this.isMore,
    this.index = 1,
  });

  final bool isMore;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final moduleNologin = state.moduleNoLoginList;
        switch (state.moduleNoLoginStatus) {
          case ModuleNoLoginStatus.loading:
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid.builder(
                itemCount: !isMore ? 6 : 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, idx) {
                  return ItemModuleWidget(
                    index: idx,
                    indexAnimation: index,
                    isLoading: true,
                  );
                },
              ),
            );

          case ModuleNoLoginStatus.success:
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid.builder(
                itemCount: !isMore ? 6 : moduleNologin.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, idx) {
                  final item = moduleNologin[idx];
                  return ItemModuleWidget(
                    image: item.imagen1,
                    index: idx,
                    indexAnimation: index,
                    ontap: () {
                      context.push(
                          "${NameRoutes.homeScreen}/${NameRoutes.moduleScreen}");
                    },
                    isLoading: false,
                  );
                },
              ),
            );

          default:
        }
        return const SliverPadding(padding: EdgeInsets.zero);
      },
    );
  }
}
