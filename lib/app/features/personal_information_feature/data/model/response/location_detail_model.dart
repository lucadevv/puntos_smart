class LocationDetailModel {
  final List<dynamic> htmlAttributions;
  final PlaceResult result;
  final String status;

  LocationDetailModel({
    required this.htmlAttributions,
    required this.result,
    required this.status,
  });

  factory LocationDetailModel.fromJson(Map<String, dynamic> json) {
    return LocationDetailModel(
      htmlAttributions: List<dynamic>.from(json['html_attributions'] ?? []),
      result: PlaceResult.fromJson(json['result'] ?? {}),
      status: json['status'] ?? '',
    );
  }
}

class PlaceResult {
  final List<AddressComponent> addressComponents;
  final String formattedAddress;
  final Geometry geometry;
  final String name;
  final String placeId;
  final List<String> types;
  final String? url; // Hacer opcional
  final int? utcOffset; // Hacer opcional
  final String? vicinity; // Hacer opcional
  final String? website; // Hacer opcional

  PlaceResult({
    required this.addressComponents,
    required this.formattedAddress,
    required this.geometry,
    required this.name,
    required this.placeId,
    required this.types,
    this.url,
    this.utcOffset,
    this.vicinity,
    this.website,
  });

  factory PlaceResult.fromJson(Map<String, dynamic> json) {
    return PlaceResult(
      addressComponents: List<AddressComponent>.from(json['address_components']
              ?.map((x) => AddressComponent.fromJson(x)) ??
          []),
      formattedAddress: json['formatted_address'] ?? '',
      geometry: Geometry.fromJson(json['geometry'] ?? {}),
      name: json['name'] ?? '',
      placeId: json['place_id'] ?? '',
      types: List<String>.from(json['types'] ?? []),
      url: json['url'],
      utcOffset: json['utc_offset'],
      vicinity: json['vicinity'],
      website: json['website'],
    );
  }
}

class AddressComponent {
  final String longName;
  final String shortName;
  final List<String> types;

  AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponent.fromJson(Map<String, dynamic> json) {
    return AddressComponent(
      longName: json['long_name'] ?? '',
      shortName: json['short_name'] ?? '',
      types: List<String>.from(json['types'] ?? []),
    );
  }
}

class Geometry {
  final Location location;
  final Viewport viewport;

  Geometry({
    required this.location,
    required this.viewport,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: Location.fromJson(json['location'] ?? {}),
      viewport: Viewport.fromJson(json['viewport'] ?? {}),
    );
  }
}

class Location {
  final double lat;
  final double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat']?.toDouble() ?? 0.0,
      lng: json['lng']?.toDouble() ?? 0.0,
    );
  }
}

class Viewport {
  final Northeast northeast;
  final Southwest southwest;

  Viewport({
    required this.northeast,
    required this.southwest,
  });

  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(
      northeast: Northeast.fromJson(json['northeast'] ?? {}),
      southwest: Southwest.fromJson(json['southwest'] ?? {}),
    );
  }
}

class Northeast {
  final double lat;
  final double lng;

  Northeast({
    required this.lat,
    required this.lng,
  });

  factory Northeast.fromJson(Map<String, dynamic> json) {
    return Northeast(
      lat: json['lat']?.toDouble() ?? 0.0,
      lng: json['lng']?.toDouble() ?? 0.0,
    );
  }
}

class Southwest {
  final double lat;
  final double lng;

  Southwest({
    required this.lat,
    required this.lng,
  });

  factory Southwest.fromJson(Map<String, dynamic> json) {
    return Southwest(
      lat: json['lat']?.toDouble() ?? 0.0,
      lng: json['lng']?.toDouble() ?? 0.0,
    );
  }
}
