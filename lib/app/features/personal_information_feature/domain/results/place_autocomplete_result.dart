import 'package:puntos_smart_user/app/features/personal_information_feature/domain/entities/place_autocomplete_entity.dart';

abstract class PlaceAutocompleteResult {}

class PlaceAutocompleteSuccess extends PlaceAutocompleteResult {
  final List<PlaceAutocompleteEntity> listPlaceAutocomplete;

  PlaceAutocompleteSuccess({required this.listPlaceAutocomplete});
}

class PlaceAutocompleteFailure extends PlaceAutocompleteResult {
  final PlaceAutocompleteFailureStatus failureStatus;

  PlaceAutocompleteFailure({required this.failureStatus});
}

enum PlaceAutocompleteFailureStatus {
  notFound,
  network,
  invalidApiKey,
  requestDenied,
  quotaExceeded,
  unknownError,
}
