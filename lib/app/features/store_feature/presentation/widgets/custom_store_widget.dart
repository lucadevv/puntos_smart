import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_image_logo_store_widget.dart';
import 'package:puntos_smart_user/app/core/widgets/detail_store_widget.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_punctation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomStoreWidget extends StatelessWidget {
  final int index;
  final VoidCallback? navigateStoreLogo;
  final VoidCallback? navigateStoresTitle;
  const CustomStoreWidget({
    super.key,
    required this.index,
    this.navigateStoreLogo,
    this.navigateStoresTitle,
  });
  Future<void> _makePhoneCall(String phoneNumber) async {
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      await Permission.phone.request();
    }

    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'No se pudo lanzar $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Container(
          height: 131,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.primary, //surface
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.greynew
                    .withOpacity(0.2), // Color de la sombra con opacidad
                spreadRadius: 1, // Extensión de la sombra
                blurRadius: 8, // Desenfoque de la sombra
                offset:
                    const Offset(0, 4), // Desplazamiento de la sombra (x, y)
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImageLogoStoreWidget(
                height: 80,
                width: 80,
                onTapLogo: navigateStoreLogo,
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: navigateStoresTitle,
                    child: Text(
                      'MacDonal\'s',
                      style: textTheme.titleMedium!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800, //w600
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const DetailStoreWidget(
                    iconImage: Iconsax.clock,
                    title: 'Lun 9.00-20.00',
                  ),
                  const SizedBox(height: 2),
                  DetailStoreWidget(
                    iconImage: Iconsax.call,
                    title: '+51 984 34 23 43',
                    makePhoneTap: () {
                      _makePhoneCall('984342343');
                    },
                  ),
                  const SizedBox(height: 2),
                  const DetailStoreWidget(
                    iconImage: Iconsax.location,
                    title: 'Ubicación',
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Iconsax.heart,
                      color: Colors.transparent, //AppColors.blacknew
                    ),
                  ),
                  const CustomPunctationWidget(color: AppColors.blacknew),
                ],
              )
            ],
          ),
        ),

        //
        Positioned(
            top: 3, // 0
            right: 18, //15
            child: Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
                // border: const Border(
                //   top: BorderSide(
                //     color: AppColors.greyligth,
                //     width: 2.0,
                //   ),
                //   right: BorderSide(
                //     color: AppColors.greyligth,
                //     width: 2.0,
                //   ),
                //   left: BorderSide.none,
                //   bottom: BorderSide.none,
                // ),
              ),
              child: const Icon(
                Iconsax.heart4, // 4 y 5
                size: 24,
                color: AppColors.blacknew,
              ),
            )),
      ],
    );
  }
}
