part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LocationStatus status;
  final List<PlaceAutocompleteEntity> placeAutoCompleteList;
  final LocationSearchStatus locationSearchStatus;
  final PlaceAutocompleteEntity locationModel;
  final LocationOnMapStatus locationOnMapStatus;

  const LocationState({
    required this.status,
    required this.placeAutoCompleteList,
    required this.locationSearchStatus,
    required this.locationModel,
    required this.locationOnMapStatus,
  });

  LocationState copyWith({
    LocationStatus? status,
    List<PlaceAutocompleteEntity>? placeAutoCompleteList,
    LocationSearchStatus? locationSearchStatus,
    PlaceAutocompleteEntity? locationModel,
    LocationOnMapStatus? locationOnMapStatus,
  }) {
    return LocationState(
      status: status ?? this.status,
      placeAutoCompleteList:
          placeAutoCompleteList ?? this.placeAutoCompleteList,
      locationSearchStatus: locationSearchStatus ?? this.locationSearchStatus,
      locationModel: locationModel ?? this.locationModel,
      locationOnMapStatus: locationOnMapStatus ?? this.locationOnMapStatus,
    );
  }

  factory LocationState.initial() {
    return LocationState(
      status: LocationStatus.initial,
      placeAutoCompleteList: const [],
      locationSearchStatus: LocationSearchStatus.initial,
      locationModel: PlaceAutocompleteEntity.empty(),
      locationOnMapStatus: LocationOnMapStatus.initial,
    );
  }

  @override
  List<Object?> get props =>
      [status, placeAutoCompleteList, locationSearchStatus, locationModel];
}

enum LocationStatus { initial, loading, success, error }

enum LocationSearchStatus { initial, loading, success, error }

enum LocationOnMapStatus { initial, loading, success, error }
