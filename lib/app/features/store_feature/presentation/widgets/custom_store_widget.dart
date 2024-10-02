import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
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
    return Container(
      height: 131,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
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
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const DetailStoreWidget(
                iconImage: AppImages.location,
                title: 'Lune 9.00-20.00',
              ),
              const SizedBox(height: 2),
              DetailStoreWidget(
                iconImage: AppImages.phone,
                title: '+51 984 34 23 43',
                makePhoneTap: () {
                  _makePhoneCall('984342343');
                },
              ),
              const SizedBox(height: 2),
              const DetailStoreWidget(
                iconImage: AppImages.location,
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                ),
              ),
              const CustomPunctationWidget(color: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}
