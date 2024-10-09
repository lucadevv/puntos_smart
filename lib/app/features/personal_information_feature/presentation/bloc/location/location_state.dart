part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LocationStatus status;

  final List<PlaceAutocompleteEntity> placeAutoCompleteList;
  final LocationSearchStatus locationSearchStatus;
  final PlaceAutocompleteEntity locationModel;

  const LocationState({
    required this.status,
    required this.placeAutoCompleteList,
    required this.locationSearchStatus,
    required this.locationModel,
  });

  LocationState copyWith({
    LocationStatus? status,
    List<PlaceAutocompleteEntity>? placeAutoCompleteList,
    LocationSearchStatus? locationSearchStatus,
    PlaceAutocompleteEntity? locationModel,
  }) {
    return LocationState(
      status: status ?? this.status,
      placeAutoCompleteList:
          placeAutoCompleteList ?? this.placeAutoCompleteList,
      locationSearchStatus: locationSearchStatus ?? this.locationSearchStatus,
      locationModel: locationModel ?? this.locationModel,
    );
  }

  factory LocationState.initial() {
    return LocationState(
      status: LocationStatus.initial,
      placeAutoCompleteList: const [],
      locationSearchStatus: LocationSearchStatus.initial,
      locationModel: PlaceAutocompleteEntity.empty(),
    );
  }

  @override
  List<Object?> get props =>
      [status, placeAutoCompleteList, locationSearchStatus, locationModel];
}

enum LocationStatus { initial, loading, success, error }

enum LocationSearchStatus { initial, loading, success, error }
