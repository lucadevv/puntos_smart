import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/domain/results/location_detail_result.dart';
import 'package:puntos_smart_user/app/features/dashboard_feature/presentation/sub_features/settings_sub_feature/presentation/pages/address_page/domain/results/place_autocomplete_result.dart';

abstract class LocationRepository {
  Future<PlaceAutocompleteResult> getAllPlaceAutoComplete(
      {required String input});
  Future<LocationDetailResult> getLocationDetail({required String placeId});
}
