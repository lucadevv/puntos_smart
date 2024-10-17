part of 'module_bloc.dart';

class ModuleState extends Equatable {
  final List<GeoPromotionsResponseEntity> listGeoPromotiosns;
  final GeoPromotionsStatus geoPromotionsStatus;
  const ModuleState({
    required this.listGeoPromotiosns,
    required this.geoPromotionsStatus,
  });

  ModuleState copyWith({
    List<GeoPromotionsResponseEntity>? listGeoPromotiosns,
    GeoPromotionsStatus? geoPromotionsStatus,
  }) =>
      ModuleState(
        listGeoPromotiosns: listGeoPromotiosns ?? this.listGeoPromotiosns,
        geoPromotionsStatus: geoPromotionsStatus ?? this.geoPromotionsStatus,
      );

  factory ModuleState.initial() => const ModuleState(
        listGeoPromotiosns: [],
        geoPromotionsStatus: GeoPromotionsStatus.inital,
      );
  @override
  List<Object> get props => [
        listGeoPromotiosns,
        geoPromotionsStatus,
      ];
}

enum GeoPromotionsStatus {
  inital,
  loading,
  success,
  notFound,
  network,
  server,
  unknown,
}
