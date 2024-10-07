import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class SliverDescWidget extends StatelessWidget {
  const SliverDescWidget({
    super.key,
    required this.categoryKeys,
    required this.textTheme,
  });

  final Map<int, GlobalKey<State<StatefulWidget>>> categoryKeys;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        key: categoryKeys[0],
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Destacados",
                style: textTheme.headlineSmall!.copyWith(
                  color: AppColors.blacknew,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 275,//269
              child: ListView.builder(
                itemCount: 10,
                itemExtent: 224,
                scrollDirection: Axis.horizontal,
                itemBuilder: (contex, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        Container(
                          height: 164,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.textfield,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Cuarto de Libra con queso",
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "  Hamburguesa de carne 100% de res con queso doble queso cheddar, cebolla ...",
                          style: textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: const AlignmentDirectional(1, 0),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              "s/ 60.00",
                              style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
