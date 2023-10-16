import 'dart:convert';

import 'package:anemoi_weather/api/open_meteo/forecast/enums.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/forecast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final String baseUrl = 'api.open-meteo.com';
  final String endpoint = 'v1/forecast';

  Future<Forecast> getForecast(double lat, double long,
      {List<CurrentQueryParameters> current = const [],
      List<HourlyQueryParameters> hourly = const [],
      List<HourlyQueryParameters> daily = const []}) async {
    final queryParams = <String, dynamic>{
      'timezone': '${TimeZone.auto}',
      'timeformat': 'unixtime',
      'latitude': '$lat',
      'longitude': '$long',
    };

    if (current.isNotEmpty) {
      queryParams['current'] = current.map((e) => e.value.toString());
    }

    if (hourly.isNotEmpty) {
      queryParams['hourly'] = hourly.map((e) => e.value.toString());
    }

    if (daily.isNotEmpty) {
      queryParams['daily'] = daily.map((e) => e.value.toString());
    }

    final url = Uri.https(baseUrl, endpoint, queryParams);
    final response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    debugPrint(map.toString());
    return Forecast.fromJson(map);
  }
}
