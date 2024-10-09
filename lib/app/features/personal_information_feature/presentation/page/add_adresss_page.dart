import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:puntos_smart_user/app/core/bloc/location/location_bloc.dart';
import 'package:puntos_smart_user/app/core/bloc/location/location_event.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  // Esta función obtiene sugerencias de direcciones usando Geocoding.
  // Future<List<String>> _getAddressSuggestions(String query) async {
  //   if (query.isEmpty) return [];

  //   try {
  //     List<Location> locations = await locationFromAddress(query);
  //     // Para cada ubicación, obtenemos la dirección completa
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //         locations.first.latitude, locations.first.longitude);
  //     return placemarks
  //         .map((placemark) => "${placemark.street}, ${placemark.locality}")
  //         .toList();
  //   } catch (e) {
  //     return ["No se encontraron resultados"];
  //   }
  // }

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
                  BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, state) {
                      if (state.status == LocationStatus.loading) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        );
                      } else if (state.status == LocationStatus.success &&
                          state.address != null) {
                        return SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Text(
                              state.address!,
                              style: textTheme.titleLarge!.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      } else if (state.status == LocationStatus.error) {
                        return const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Text("Error al obtener la ubicación"),
                          ),
                        );
                      }

                      return const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Text("No se pudo obtener la dirección"),
                        ),
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomButtonWidget(
                        title: 'Obtener Ubicación Actual',
                        onTap: () {
                          context
                              .read<LocationBloc>()
                              .add(GetCurrentLocation());
                        },
                        width: 300,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomButtonWidget(
                        title: 'Seleccionar Ubicación en Mapa',
                        onTap: () {
                          _openMap(context);
                        },
                        width: 300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openMap(BuildContext context) {
    final lat = context.read<LocationBloc>().state.selectedLatitude ?? 0.0;
    final log = context.read<LocationBloc>().state.selectedLongitude ?? 0.0;

    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return SizedBox(
    //       height: MediaQuery.of(context).size.height * 0.7,
    //       child: GoogleMap(
    //         initialCameraPosition: CameraPosition(
    //           target: LatLng(lat, log),
    //           zoom: 14.0,
    //         ),
    //         onTap: (LatLng selectedLocation) {
    //           context.read<LocationBloc>().add(SelectLocationOnMap(
    //               selectedLocation.latitude, selectedLocation.longitude));
    //           Navigator.of(context).pop();
    //         },
    //       ),
    //     );
    //   },
    // );
  }
}
