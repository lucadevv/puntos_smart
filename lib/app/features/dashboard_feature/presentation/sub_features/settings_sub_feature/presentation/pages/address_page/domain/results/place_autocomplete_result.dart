import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/domain/entities/place_autocomplete_entity.dart';

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
