import 'package:puntos_smart_user/app/features/personal_information_feature/domain/results/location_detail_result.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/domain/results/place_autocomplete_result.dart';

abstract class LocationRepository {
  Future<PlaceAutocompleteResult> getAllPlaceAutoComplete(
      {required String input});
  Future<LocationDetailResult> getLocationDetail({required String placeId});
}
