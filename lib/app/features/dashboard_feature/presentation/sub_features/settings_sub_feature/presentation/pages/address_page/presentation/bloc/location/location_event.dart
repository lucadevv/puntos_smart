import 'package:equatable/equatable.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrentLocation extends LocationEvent {}

class SearchLocationByText extends LocationEvent {
  final String query;

  const SearchLocationByText(this.query);

  @override
  List<Object?> get props => [query];
}

class SelectLocationOnMap extends LocationEvent {
  // final double latitude;
  // final double longitude;

  // const SelectLocationOnMap(this.latitude, this.longitude);

  // @override
  // List<Object?> get props => [latitude, longitude];
}

class SelectedLocationEvent extends LocationEvent {
  final String placeId;

  const SelectedLocationEvent({required this.placeId});
  @override
  List<Object?> get props => [placeId];
}
