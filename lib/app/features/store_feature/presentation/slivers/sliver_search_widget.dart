import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/persisten_header_delegate.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/customt_extformfield_widget.dart';

class SliverSearchWidget extends StatelessWidget {
  const SliverSearchWidget({
    super.key,
    required bool showBackIcon,
    required this.safeAreaTop,
    required FocusNode focusNode,
    this.searchController,
    this.onChanged,
  })  : _showBackIcon = showBackIcon,
        _focusNode = focusNode;

  final bool _showBackIcon;
  final double safeAreaTop;
  final FocusNode _focusNode;
  final TextEditingController? searchController;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MySliverPersistentHeaderDelegate(
        minHeight: _showBackIcon ? 140.0 : 80,
        maxHeight: _showBackIcon ? 140.0 : 80,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300), // Suaviza la transición
          curve: Curves.easeInOut, // Define una curva de animación suave
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
            top: _showBackIcon ? safeAreaTop : null,
          ),
          child: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(
                    milliseconds: 300), // Transición suave para el ícono
                child: _showBackIcon
                    ? Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppColors.greyligth, //arrowbacButtonColor
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(
                            Iconsax.arrow_left_2,
                            color: AppColors.greymedium,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _showBackIcon
                    ? const SizedBox(width: 12)
                    : const SizedBox(width: 0),
              ),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut, // Suavizar la transición del padding
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CustomTextFormFielWidget(
                    controller: searchController,
                    unFocus: _focusNode,
                    hintText: 'Buscar',
                    iconDataPrefix: const Icon(
                      Iconsax.search_normal,
                      color: AppColors.greymedium,
                    ),
                    onChanged: onChanged,
                    isSearch: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
