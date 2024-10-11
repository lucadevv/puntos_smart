import 'package:latlong2/latlong.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/data/model/response/location_detail_model.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/data/model/response/place_autocomplete_model_response.dart';

class PlaceAutocompleteEntity {
  final String description;
  final String placeId;
  final LatLng? latLng;

  PlaceAutocompleteEntity({
    required this.description,
    required this.placeId,
    this.latLng,
  });

  factory PlaceAutocompleteEntity.fromModel(PredictionModelResponse model) {
    return PlaceAutocompleteEntity(
      description: model.description,
      placeId: model.placeId,
    );
  }

  factory PlaceAutocompleteEntity.fromModelDetail(LocationDetailModel model) {
    return PlaceAutocompleteEntity(
        description: model.result.formattedAddress,
        placeId: model.result.placeId,
        latLng: LatLng(model.result.geometry.location.lat,
            model.result.geometry.location.lng));
  }

  static List<PlaceAutocompleteEntity> fromModelList(
      List<PredictionModelResponse> modelList) {
    return modelList
        .map((model) => PlaceAutocompleteEntity.fromModel(model))
        .toList();
  }

  factory PlaceAutocompleteEntity.empty() => PlaceAutocompleteEntity(
        description: '',
        placeId: '',
      );
}
