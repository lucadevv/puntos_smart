import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/app_text.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/custom_arrow_back.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key, required this.isPrivacyPolicies});

  final bool isPrivacyPolicies;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              isPrivacyPolicies
                  ? AppText.privacyPolicy
                  : AppText.termnsAndConditinos2,
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                isPrivacyPolicies ? texto : 'terminos y condiciones ' + texto,
                style: TextStyle(fontSize: 12 , color: AppColors.blacknew),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const texto =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt'
    'ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco'
    'laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate'
    'velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt'
    'in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur'
    'adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim '
    'veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute'
    'irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur'
    'sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem '
    'ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore '
    'magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea'
    'commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat '
    'nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit '
    'anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor ¿'
    '¿¿incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco ¿¿'
    'laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate'
    'velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt'
    'in culpa qui officia deserunt mollit anim id est laborum.'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi '
    'ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit '
    'in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur '
    'sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt '
    'mollit anim id est laborum. Este es un texto muy largo que se puede desplazar '
    'y no tiene límite de líneas. El texto puede continuar indefinidamente '
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi '
    'ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit '
    'in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur '
    'sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt '
    'mollit anim id est laborum. Este es un texto muy largo que se puede desplazar '
    'y no tiene límite de líneas. El texto puede continuar indefinidamente '
    'sin estar limitado por la cantidad de líneas o tamaño de pantalla.'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi '
    'ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit '
    'in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur '
    'sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt '
    'mollit anim id est laborum. Este es un texto muy largo que se puede desplazar '
    'y no tiene límite de líneas. El texto puede continuar indefinidamente '
    'sin estar limitado por la cantidad de líneas o tamaño de pantalla.'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi '
    'ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit '
    'in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur '
    'sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt '
    'mollit anim id est laborum. Este es un texto muy largo que se puede desplazar '
    'y no tiene límite de líneas. El texto puede continuar indefinidamente '
    'sin estar limitado por la cantidad de líneas o tamaño de pantalla.'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi '
    'ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit '
    'in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur '
    'sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt '
    'mollit anim id est laborum. Este es un texto muy largo que se puede desplazar '
    'y no tiene límite de líneas. El texto puede continuar indefinidamente '
    'sin estar limitado por la cantidad de líneas o tamaño de pantalla.'
    'sin estar limitado por la cantidad de líneas o tamaño de pantalla.';
