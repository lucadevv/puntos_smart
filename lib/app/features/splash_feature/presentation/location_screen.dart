import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_bloc.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_event.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: kToolbarHeight),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(AppImages.locationOne),
              Text(
                AppText.activeMyLocation,
                style: textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                AppText.activeLocationDescription,
                style: textTheme.titleSmall!.copyWith(
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              BlocConsumer<LocationBloc, LocationState>(
                listener: (context, state) {
                  switch (state.status) {
                    case LocationStatus.success:
                      context.go(NameRoutes.homeScreen);
                      break;
                    default:
                  }
                },
                builder: (context, state) {
                  switch (state.status) {
                    case LocationStatus.loading:
                      return CustomButtonWidget(
                        title: AppText.loading,
                        width: size.width,
                        onTap: () {},
                      );

                    default:
                  }
                  return CustomButtonWidget(
                    title: "Utilizar mi ubicación actual",
                    width: size.width,
                    onTap: () {
                      context.read<LocationBloc>().add(GetCurrentLocation());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
