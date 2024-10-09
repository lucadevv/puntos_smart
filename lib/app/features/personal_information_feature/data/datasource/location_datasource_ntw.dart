import 'dart:convert';

import 'package:puntos_smart_user/app/api/network/api_client.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/data/model/response/location_detail_model.dart';
import 'package:puntos_smart_user/app/features/personal_information_feature/data/model/response/place_autocomplete_model_response.dart';

class LocationDatasourceNtw {
  final ApiClient _apiClient;
  LocationDatasourceNtw({required ApiClient apiClient})
      : _apiClient = apiClient;
  Future<PlaceAutocompleteModelResponse> getAllPlaceAutoComplete(
      {required String input}) async {
    const String apiKey = String.fromEnvironment('api_key_place_autocomplete');

    try {
      String pathRequest =
          "/maps/api/place/autocomplete/json?input=$input&key=$apiKey";
      final response = await _apiClient.getData(pathRequest);
      if (response.statusCode == 200) {
        var data = response.data;
        return PlaceAutocompleteModelResponse.fromJson(data);
      } else {
        throw Exception("Failed to load suggestions");
      }
    } catch (e) {
      throw Exception("Error during API request");
    }
  }

  Future<LocationDetailModel> getLocationDetail(
      {required String placeId}) async {
    const String apiKey = String.fromEnvironment('api_key_place_autocomplete');
    try {
      String pathRequest =
          "/maps/api/place/details/json?place_id=$placeId&key=$apiKey";
      final response = await _apiClient.getData(pathRequest);

      if (response.statusCode == 200) {
        var data = response.data;
        // printFormattedJson(data);
        final model = LocationDetailModel.fromJson(data);
        return model;
      } else {
        throw Exception("Failed to load suggestions");
      }
    } catch (e) {
      throw Exception("Error during API request");
    }
  }
}

void printFormattedJson(Map<String, dynamic> json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String prettyPrint = encoder.convert(json);

  // Divide el JSON formateado en líneas
  List<String> lines = prettyPrint.split('\n');

  for (String line in lines) {
    print(line); // Imprime cada línea individualmente
  }
}
