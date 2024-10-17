import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/slivers/persisten_header_delegate.dart';

class SliverCategoriesWidget extends StatelessWidget {
  const SliverCategoriesWidget({
    super.key,
    required this.onSelected,
    required this.indexSelected,
  });

  // Cambiamos VoidCallback a ValueChanged<int> para pasar el índice
  final ValueChanged<int> onSelected;
  final int indexSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverPersistentHeader(
      pinned: true,
      delegate: MySliverPersistentHeaderDelegate(
        minHeight: 45.0, // Altura mínima
        maxHeight: 45.0, // Altura máxima
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: AppColors.surface,
                width: 1,
              ),
            ),
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal, // Scroll horizontal
            itemCount: categorias.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10); // Espacio entre elementos
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  onSelected(index); // Llamar a la función con el índice
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: indexSelected == index
                                ? AppColors.onPrimary
                                : Colors.grey,
                            fontSize: indexSelected == index ? 16 : 14,
                          ),
                          child: Text(
                            categorias[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: AnimatedContainer(
                        height: 4,
                        width: indexSelected == index ? 150 : 0,
                        decoration: BoxDecoration(
                          color: indexSelected == index
                              ? AppColors.onPrimary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        duration: const Duration(milliseconds: 200),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

List<String> categorias = [
  'Destacadas',
  'Nuevas',
  'Populares',
  'Recomendadas',
  'Tendencias',
];
