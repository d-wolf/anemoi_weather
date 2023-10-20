import 'dart:convert';

import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/data/search_location/models/geocoding_search_results_model.dart';
import 'package:anemoi_weather/src/domain/search_location/entities/geocoding_search_results.dart';
import 'package:http/http.dart' as http;

abstract class GeocodingRemoteDataSource {
  Future<GeocodingSearchResults> search(
    String name,
    int count,
    String languageCode,
  );
}

class GeocodingRemoteDataSourceImpl implements GeocodingRemoteDataSource {
  final String baseUrl = 'geocoding-api.open-meteo.com';
  final String endpointSearch = 'v1/search';

  @override
  Future<GeocodingSearchResults> search(
    String name,
    int count,
    String languageCode,
  ) async {
    final queryParams = <String, dynamic>{
      'name': name,
      'count': count.toString(),
      'language': languageCode,
      'format': 'json',
    };

    final response =
        await http.get(Uri.https(baseUrl, endpointSearch, queryParams));
    final map = jsonDecode(response.body) as DataMap;
    return GeocodingSearchResultsModel.fromJson(map);
  }
}
