import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/data/datasource/location_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/data/model/response/place_autocomplete_model_response.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/domain/entities/place_autocomplete_entity.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/domain/repository/location_repository.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/domain/results/location_detail_result.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/domain/results/place_autocomplete_result.dart';

class LocationRespositoryImpl extends LocationRepository {
  final LocationDatasourceNtw _locationDatasourceNtw;
  LocationRespositoryImpl(
      {required LocationDatasourceNtw locationDatasourceNtw})
      : _locationDatasourceNtw = locationDatasourceNtw;

  @override
  Future<PlaceAutocompleteResult> getAllPlaceAutoComplete(
      {required String input}) async {
    try {
      final response =
          await _locationDatasourceNtw.getAllPlaceAutoComplete(input: input);
      final List<PredictionModelResponse> predictions = response.predictions;
      final List<PlaceAutocompleteEntity> listPlaceAutocomplete =
          PlaceAutocompleteEntity.fromModelList(predictions);

      return PlaceAutocompleteSuccess(
          listPlaceAutocomplete: listPlaceAutocomplete);
    } catch (e) {
      if (e is DioException) {
        return PlaceAutocompleteFailure(
          failureStatus: PlaceAutocompleteFailureStatus.quotaExceeded,
          // signUpFailureStatus: ErrorHandler.handleDioError(e),
        );
      } else {
        return PlaceAutocompleteFailure(
          failureStatus: PlaceAutocompleteFailureStatus.unknownError,
        );
      }
    }
  }

  @override
  Future<LocationDetailResult> getLocationDetail(
      {required String placeId}) async {
    try {
      final response =
          await _locationDatasourceNtw.getLocationDetail(placeId: placeId);
      final placeAutocompleteEntity =
          PlaceAutocompleteEntity.fromModelDetail(response);

      return LocationDetailSuccess(
        placeAutocompleteEntity: placeAutocompleteEntity,
      );
    } catch (e) {
      if (e is DioException) {
        return LocationDetailFailure(
          locationDetailFailureStatus: LocationDetailFailureStatus.unknownError,
        );
      } else {
        return LocationDetailFailure(
          locationDetailFailureStatus: LocationDetailFailureStatus.unknownError,
        );
      }
    }
  }
}
