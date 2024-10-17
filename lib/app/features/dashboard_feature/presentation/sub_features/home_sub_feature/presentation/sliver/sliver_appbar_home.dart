import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/modals/location_modal.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_bloc.dart';

class SliverAppbarHomePage extends StatelessWidget {
  const SliverAppbarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            AppText.myLocation,
            style: textTheme.titleSmall!.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocSelector<LocationBloc, LocationState, String>(
                selector: (state) => state.locationModel.description,
                builder: (context, address) {
                  if (address.trim().isEmpty) {
                    return Text(
                      "Selecciona una ubicación",
                      style: textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }

                  return Flexible(
                    child: Text(
                      address,
                      style: textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                    ),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  // showModalBottomSheet(
                  //   context: context,
                  //   isScrollControlled: true,
                  //   builder: (BuildContext context) {
                  //     return const LocationModal();
                  //   },
                  // );
                },
                child: const Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Image.asset(
          AppImages.logoPuntosSmart,
          width: 10,
          height: 10,
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Badge.count(
            count: 19,
            smallSize: 40,
            largeSize: 20,
            child: const Icon(
              Iconsax.notification,
              color: AppColors.greymedium,
              size: 35,
            ),
          ),
        )
      ],
    );
  }
}
