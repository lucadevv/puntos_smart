import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/app_text.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/custom_arrow_back.dart';

class SupportServicesScreen extends StatelessWidget {
  const SupportServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              AppText.supportServices,
              style: textTheme.bodyLarge!.copyWith(
                color: AppColors.blacknew,
                fontWeight: FontWeight.w600,
              ),
            ),
            leadingWidth: 70,
            leading: const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 4),
              child: CustomButtonArrowBack(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/Active_Support.png',
                      scale: 1,
                    ),
                  ),
                  //const SizedBox(height: 16),
                  Center(
                    child: Text(
                      '¿Necesitas ayuda?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blacknew,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Contáctanos:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blacknew,
                    ),
                  ),
                  const SizedBox(height: 10),
                  support_custom(
                    icon: Iconsax.location_tick,
                    title: 'Dirección',
                    description: 'Jr. Sol de oro 7191, Lima 24456312, Perú',
                  ),
                  const SizedBox(height: 10),
                  support_custom(
                      icon: Iconsax.call,
                      title: 'Escríbenos por WhatsApp',
                      description: '+51 998 658 598'),
                  const SizedBox(height: 10),
                  support_custom(
                      icon: Iconsax.sms,
                      title: 'Envianos un correo electrónico',
                      description: 'soporte@puntossmart.com'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class support_custom extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const support_custom({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Color(0xFFB2FCFF), borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Icon(
                  icon,
                  color: AppColors.onPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.blacknew,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  style:
                      const TextStyle(fontSize: 12, color: AppColors.blacknew),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
