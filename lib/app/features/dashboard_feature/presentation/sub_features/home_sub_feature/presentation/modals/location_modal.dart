import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/extension/custom_extension.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_bloc.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/presentation/bloc/location/location_event.dart';

class LocationModal extends StatelessWidget {
  const LocationModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.3,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
          6.hSpace,
          Divider(
            color: Colors.grey.shade200,
          ),
          12.hSpace,
          ListTile(
            onTap: () {
              context.read<LocationBloc>().add(GetCurrentLocation());
            },
            leading: const Icon(
              Icons.gps_fixed,
              color: Colors.black,
            ),
            title: Text(
              AppText.myCurrentLocation,
              style: textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: BlocSelector<LocationBloc, LocationState, LocationStatus>(
              selector: (state) => state.status,
              builder: (context, state) {
                if (state == LocationStatus.loading) {
                  return const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state.locationOnMapStatus == LocationOnMapStatus.success) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const MapWidget();
                  },
                );
              } else if (state.locationOnMapStatus ==
                  LocationOnMapStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error al obtener ubicación')),
                );
              }
            },
            child: ListTile(
              onTap: () {
                context.read<LocationBloc>().add(SelectLocationOnMap());
              },
              leading: const Icon(
                Icons.map,
                color: Colors.black,
              ),
              title: Text(
                AppText.selectOnMap,
                style: textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: BlocSelector<LocationBloc, LocationState,
                  LocationOnMapStatus>(
                selector: (state) => state.locationOnMapStatus,
                builder: (context, state) {
                  if (state == LocationOnMapStatus.loading) {
                    return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          ListTile(
            onTap: () {
              context.pop();
            },
            leading: const Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
            title: Text(
              AppText.seeMore,
              style: textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  final String mapboxStylev11 = "mapbox/dark-v11";
  final String mapboxStylev12 = "mapbox/navigation-night-v1";
  final String token =
      "pk.eyJ1IjoicHVudG9zc21hcnRwZXJ1IiwiYSI6ImNtMjN0a2t4ZzA5ejkya3BuMDl4dW41N3EifQ.vAQjeRFblvGSV3WiaV1Olg";

  final locationCenter = const LatLng(-12.00629745, -77.0587862806646);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final location = context.watch<LocationBloc>().state.locationModel.latLng;
    return SizedBox(
      height: size.height * 0.9,
      width: size.width,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: FlutterMap(
              options: MapOptions(
                initialCenter: location ?? locationCenter,
                minZoom: 5,
                maxZoom: 16,
                initialZoom: 16, // Zoom inicial
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/{id}/tiles/256/{z}/{x}/{y}@2x?access_token=$token",
                  additionalOptions: {
                    'accessToken': token,
                    'id': mapboxStylev12,
                  },
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: location ?? locationCenter,
                      child: const Icon(
                        Icons.location_on,
                        size: 50,
                        color: AppColors.onPrimary,
                      ),
                    ),
                    Marker(
                      point: locationCenter,
                      child: const Icon(
                        Icons.location_on,
                        size: 50,
                        color: AppColors.onPrimary,
                      ),
                    ),
                    ...List.generate(storeMarkers.length, (index) {
                      final item = storeMarkers[index];
                      return item;
                    })
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.close,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Store {
  final String name;
  final LatLng location;
  final String imageUrl;

  Store({
    required this.name,
    required this.location,
    required this.imageUrl,
  });
}

final List<Store> stores = [
  // Plaza Norte - Independencia
  Store(
    name: 'Tottus Plaza Norte',
    location: const LatLng(-11.9910, -77.0600),
    imageUrl: "https://example.com/tottus_plaza_norte.jpg",
  ),
  Store(
    name: 'Ripley Plaza Norte',
    location: const LatLng(-11.9902, -77.0621),
    imageUrl: "https://example.com/ripley_plaza_norte.jpg",
  ),

  // Comas
  Store(
    name: 'Metro Comas',
    location: const LatLng(-11.9620, -77.0467),
    imageUrl: "https://example.com/metro_comas.jpg",
  ),
  Store(
    name: 'Plaza Vea Comas',
    location: const LatLng(-11.9643, -77.0489),
    imageUrl: "https://example.com/plazavea_comas.jpg",
  ),

  // Callao
  Store(
    name: 'Saga Falabella Callao',
    location: const LatLng(-12.0500, -77.1165),
    imageUrl: "https://example.com/falabella_callao.jpg",
  ),
  Store(
    name: 'Ripley Mall Aventura Callao',
    location: const LatLng(-12.0480, -77.1157),
    imageUrl: "https://example.com/ripley_callao.jpg",
  ),

  // Miraflores
  Store(
    name: 'Tottus Miraflores',
    location: const LatLng(-12.1225, -77.0290),
    imageUrl: "https://example.com/tottus_miraflores.jpg",
  ),
  Store(
    name: 'Burger King Miraflores',
    location: const LatLng(-12.1238, -77.0307),
    imageUrl: "https://example.com/burgerking_miraflores.jpg",
  ),

  // San Isidro
  Store(
    name: 'Wong San Isidro',
    location: const LatLng(-12.1010, -77.0360),
    imageUrl: "https://example.com/wong_sanisidro.jpg",
  ),
  Store(
    name: 'Ripley San Isidro',
    location: const LatLng(-12.1002, -77.0375),
    imageUrl: "https://example.com/ripley_sanisidro.jpg",
  ),

  // Jockey Plaza
  Store(
    name: 'Metro Jockey Plaza',
    location: const LatLng(-12.0885, -76.9755),
    imageUrl: "https://example.com/metro_jockeyplaza.jpg",
  ),
  Store(
    name: 'Ripley Jockey Plaza',
    location: const LatLng(-12.0870, -76.9770),
    imageUrl: "https://example.com/ripley_jockeyplaza.jpg",
  ),

  // Surco
  Store(
    name: 'Wong Surco',
    location: const LatLng(-12.1310, -76.9715),
    imageUrl: "https://example.com/wong_surco.jpg",
  ),
  Store(
    name: 'Plaza Vea Surco',
    location: const LatLng(-12.1292, -76.9701),
    imageUrl: "https://example.com/plazavea_surco.jpg",
  ),

  // San Borja
  Store(
    name: 'Plaza Vea San Borja',
    location: const LatLng(-12.1108, -76.9930),
    imageUrl: "https://example.com/plazavea_sanborja.jpg",
  ),
  Store(
    name: 'Tottus San Borja',
    location: const LatLng(-12.1088, -76.9920),
    imageUrl: "https://example.com/tottus_sanborja.jpg",
  ),

  // San Miguel
  Store(
    name: 'Wong San Miguel',
    location: const LatLng(-12.0762, -77.0895),
    imageUrl: "https://example.com/wong_sanmiguel.jpg",
  ),
  Store(
    name: 'Ripley San Miguel',
    location: const LatLng(-12.0750, -77.0880),
    imageUrl: "https://example.com/ripley_sanmiguel.jpg",
  ),

  // Ate
  Store(
    name: 'Metro Ate',
    location: const LatLng(-12.0475, -76.9425),
    imageUrl: "https://example.com/metro_ate.jpg",
  ),
  Store(
    name: 'Plaza Vea Ate',
    location: const LatLng(-12.0460, -76.9430),
    imageUrl: "https://example.com/plazavea_ate.jpg",
  ),

  // La Molina
  Store(
    name: 'Wong La Molina',
    location: const LatLng(-12.0890, -76.9502),
    imageUrl: "https://example.com/wong_lamolina.jpg",
  ),
  Store(
    name: 'Plaza Vea La Molina',
    location: const LatLng(-12.0885, -76.9515),
    imageUrl: "https://example.com/plazavea_lamolina.jpg",
  ),

  // Chorrillos
  Store(
    name: 'Metro Chorrillos',
    location: const LatLng(-12.1870, -77.0145),
    imageUrl: "https://example.com/metro_chorrillos.jpg",
  ),
  Store(
    name: 'Plaza Vea Chorrillos',
    location: const LatLng(-12.1850, -77.0155),
    imageUrl: "https://example.com/plazavea_chorrillos.jpg",
  ),

  // Lince
  Store(
    name: 'Metro Lince',
    location: const LatLng(-12.0805, -77.0418),
    imageUrl: "https://example.com/metro_lince.jpg",
  ),
  Store(
    name: 'Plaza Vea Lince',
    location: const LatLng(-12.0798, -77.0429),
    imageUrl: "https://example.com/plazavea_lince.jpg",
  ),

  // Jesús María
  Store(
    name: 'Tottus Jesús María',
    location: const LatLng(-12.0865, -77.0485),
    imageUrl: "https://example.com/tottus_jesusmaria.jpg",
  ),
  Store(
    name: 'Plaza Vea Jesús María',
    location: const LatLng(-12.0855, -77.0490),
    imageUrl: "https://example.com/plazavea_jesusmaria.jpg",
  ),

  // Pueblo Libre
  Store(
    name: 'Tottus Pueblo Libre',
    location: const LatLng(-12.0768, -77.0680),
    imageUrl: "https://example.com/tottus_pueblolibre.jpg",
  ),
  Store(
    name: 'Plaza Vea Pueblo Libre',
    location: const LatLng(-12.0759, -77.0690),
    imageUrl: "https://example.com/plazavea_pueblolibre.jpg",
  ),
];

List<Marker> storeMarkers = stores.map((store) {
  return Marker(
    width: 100, height: 100,
    point: store.location, // Ubicación de la tienda
    child: Column(
      children: [
        // Image.network(store.imageUrl, width: 40), // Imagen de la tienda
        Text(
          store.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ), // Nombre de la tienda
        const Icon(
          Icons.location_on,
          size: 40,
          color: AppColors.onPrimary,
        ), // Icono de marcador
      ],
    ),
  );
}).toList();
