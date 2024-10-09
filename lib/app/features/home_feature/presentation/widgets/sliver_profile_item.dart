import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/extension/custom_extension.dart';
import 'package:puntos_smart_user/app/features/home_feature/domain/profile/profile_model_item.dart';

class SliverProfilesItems extends StatelessWidget {
  const SliverProfilesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(top: 12),
        child: Row(
          children: List.generate(
            profileList.length,
            (index) {
              final item = profileList[index];
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (index == 0) {
                            context.push(NameRoutes.personalInformationScreen);
                          } else if (index == 1) {
                            context.push(NameRoutes.addressScreen);
                          } else if (index == 2) {
                            context.push(NameRoutes.personalPreferencesScreen);
                          } /*else if (index == 3) {
                            context.push(NameRoutes.favoritesScreen);
                          }*/
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: item.widget,
                          ),
                        ),
                      ),
                      16.hSpace,
                      Text(
                        item.title,
                        style: textTheme.labelSmall!.copyWith(
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
