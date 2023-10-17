import 'dart:convert';

import 'package:anemoi_weather/api/forecast/forecast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GeocodingRemoteDataSource {
  final String baseUrl = 'geocoding-api.open-meteo.com';
  final String endpointSearch = 'v1/search';

  Future<Forecast> search(
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

    final url = Uri.https(baseUrl, endpointSearch, queryParams);
    final response = await http.get(url);
    debugPrint(response.body);
    Map<String, dynamic> map = jsonDecode(response.body);
    final forecast = Forecast.fromJson(map);
    return forecast;
  }
}
