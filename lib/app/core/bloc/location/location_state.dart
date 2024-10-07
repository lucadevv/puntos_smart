part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LocationStatus status;
  final String? address;
  final Position? currentPosition;
  final double? selectedLatitude;
  final double? selectedLongitude;
  final List<String>? searchResults;

  const LocationState({
    required this.status,
    this.address,
    this.currentPosition,
    this.selectedLatitude,
    this.selectedLongitude,
    this.searchResults,
  });

  factory LocationState.initial() {
    return const LocationState(
      status: LocationStatus.initial,
      address: null,
      currentPosition: null,
      selectedLatitude: null,
      selectedLongitude: null,
      searchResults: null,
    );
  }

  LocationState copyWith({
    LocationStatus? status,
    String? address,
    Position? currentPosition,
    double? selectedLatitude,
    double? selectedLongitude,
    List<String>? searchResults,
  }) {
    return LocationState(
      status: status ?? this.status,
      address: address ?? this.address,
      currentPosition: currentPosition ?? this.currentPosition,
      selectedLatitude: selectedLatitude ?? this.selectedLatitude,
      selectedLongitude: selectedLongitude ?? this.selectedLongitude,
      searchResults: searchResults ?? this.searchResults,
    );
  }

  @override
  List<Object?> get props => [
        status,
        address,
        currentPosition,
        selectedLatitude,
        selectedLongitude,
        searchResults,
      ];
}

enum LocationStatus { initial, loading, success, error }
