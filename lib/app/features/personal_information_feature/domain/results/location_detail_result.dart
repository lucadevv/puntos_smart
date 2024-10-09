import 'package:puntos_smart_user/app/features/personal_information_feature/domain/entities/place_autocomplete_entity.dart';

abstract class LocationDetailResult {}

class LocationDetailSuccess extends LocationDetailResult {
  final PlaceAutocompleteEntity placeAutocompleteEntity;

  LocationDetailSuccess({required this.placeAutocompleteEntity});
}

class LocationDetailFailure extends LocationDetailResult {
  final LocationDetailFailureStatus locationDetailFailureStatus;

  LocationDetailFailure({required this.locationDetailFailureStatus});
}

enum LocationDetailFailureStatus {
  notFound,
  network,
  invalidApiKey,
  requestDenied,
  quotaExceeded,
  unknownError,
}
