import 'dart:convert';

import 'package:anemoi_weather/api/open_meteo/forecast/forecast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum CurrentQueryParameters {
  temperature2m('temperature_2m'),
  windspeed_10m('windspeed_10m'),
  relativehumidity_2m('relativehumidity_2m'),
  weathercode('weathercode'),
  rain('rain'),
  snowfall('snowfall'),
  isDay('is_day');

  const CurrentQueryParameters(this.value);

  factory CurrentQueryParameters.fromString(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => CurrentQueryParameters.values.first,
    );
  }

  final String value;

  @override
  String toString() => value;
}

enum HourlyQueryParameters {
  temperature2m('temperature_2m'),
  windspeed_10m('windspeed_10m'),
  relativehumidity_2m('relativehumidity_2m'),
  weathercode('weathercode'),
  rain('rain'),
  snowfall('snowfall');

  const HourlyQueryParameters(this.value);

  factory HourlyQueryParameters.fromString(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => HourlyQueryParameters.values.first,
    );
  }

  final String value;

  @override
  String toString() => value;
}

enum DailyQueryParameters {
  temperature2m('temperature_2m'),
  windspeed_10m('windspeed_10m'),
  relativehumidity_2m('relativehumidity_2m'),
  weathercode('weathercode');

  const DailyQueryParameters(this.value);

  factory DailyQueryParameters.fromString(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => DailyQueryParameters.values.first,
    );
  }

  final String value;

  @override
  String toString() => value;
}

class RemoteDataSource {
  final String baseUrl = 'api.open-meteo.com';
  final String endpoint = 'v1/forecast';

  Future<Forecast> getForecast(double lat, double long,
      {List<CurrentQueryParameters> current = const [],
      List<HourlyQueryParameters> hourly = const []}) async {
    final queryParams = <String, dynamic>{
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

    final url = Uri.https(baseUrl, endpoint, queryParams);
    var response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    debugPrint(map.toString());
    return Forecast.fromJson(map);
  }
}
