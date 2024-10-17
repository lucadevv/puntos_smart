import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_bloc.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_event.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:geocoding/geocoding.dart';

import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/home_sub_feature/presentation/pages/modules/pages/store_detail/presentation/slivers/sliver_search_widget.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    leading: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Text(
                        AppText.newAddress,
                        style: textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SliverSearchWidget(
                    searchController: _searchController,
                    showBackIcon: false,
                    safeAreaTop: 0,
                    focusNode: FocusNode(),
                    onChanged: (query) {
                      context
                          .read<LocationBloc>()
                          .add(SearchLocationByText(query));
                    },
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ListTile(
                          onTap: () {
                            context
                                .read<LocationBloc>()
                                .add(GetCurrentLocation());
                          },
                          leading: const Icon(
                            Icons.gps_fixed,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Mi ubicación actual",
                            style: textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        BlocBuilder<LocationBloc, LocationState>(
                          builder: (context, state) {
                            switch (state.status) {
                              case LocationStatus.loading:
                                return ListTile(
                                  leading: const CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    "Cargando...",
                                    style: textTheme.bodyMedium!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              case LocationStatus.success:
                                return ListTile(
                                  leading: const Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    state.locationModel.description,
                                    style: textTheme.bodyMedium!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              case LocationStatus.error:
                                return ListTile(
                                  leading: const Icon(
                                    Icons.location_off,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    "Error al obtener la ubicación",
                                    style: textTheme.bodyMedium!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );

                              default:
                                return const SizedBox.shrink();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, state) {
                      final list = state.placeAutoCompleteList;
                      if (state.locationSearchStatus ==
                          LocationSearchStatus.loading) {
                        return const SliverToBoxAdapter(
                            child: CircularProgressIndicator());
                      }
                      return SliverVisibility(
                        visible:
                            _searchController.text.isNotEmpty ? true : false,
                        sliver: SliverList.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final item = list[index];
                            return ListTile(
                              onTap: () {
                                context.read<LocationBloc>().add(
                                    SelectedLocationEvent(
                                        placeId: item.placeId));
                                _searchController.clear();
                              },
                              leading: const Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              title: Text(
                                item.description,
                                style: textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
