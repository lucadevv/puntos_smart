import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/extension/custom_extension.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';

import '../../../../../../../../../core/widgets/custom_arrow_back.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    leadingWidth: 70,
                    leading: const Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 4),
                      child: CustomButtonArrowBack(),
                    ),
                    centerTitle: true,
                    title: Text(
                      AppText.personalInformation,
                      style: textTheme.bodyLarge!.copyWith(
                        color: AppColors.blacknew,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 16, vertical: 12),
                  //     child: Text(
                  //       AppText.address,
                  //       style: textTheme.titleLarge!.copyWith(
                  //         color: Colors.black87,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ListTile(
                          leading: const Icon(
                            Iconsax.location4,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Jr. Sol de Oro 7181",
                            style: textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          subtitle: Text(
                            "Casa",
                            style: textTheme.bodySmall!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: SizedBox(
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.check,
                                  color: AppColors.descriptionColor,
                                ),
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return const AdressEditModal();
                                      },
                                    );
                                  },
                                  color: AppColors.descriptionColor,
                                  icon: const Icon(
                                    Icons.menu_sharp,
                                    color: AppColors.descriptionColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: kToolbarHeight * 0.5,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButtonWidget(
                  title: "Agregar dirección",
                  width: size.width,
                  onTap: () {
                    context.push(NameRoutes.addAddressPage);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdressEditModal extends StatelessWidget {
  const AdressEditModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 4,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          16.hSpace,
          Divider(
            color: Colors.grey.shade200,
          ),
          16.hSpace,
          ListTile(
            leading: const Icon(
              Iconsax.edit,
              color: Colors.grey,
            ),
            title: Text(
              "Editar dirección",
              style: textTheme.bodySmall!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Iconsax.trash,
              color: Colors.redAccent,
            ),
            title: Text(
              "Eliminar dirección",
              style: textTheme.bodySmall!.copyWith(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
