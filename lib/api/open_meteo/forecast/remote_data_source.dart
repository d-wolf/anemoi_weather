import 'dart:convert';

import 'package:anemoi_weather/api/open_meteo/forecast/forecast.dart';
import 'package:http/http.dart' as http;

enum CurrentOptions {
  temperature2m('temperature_2m'),
  windspeed_10m('windspeed_10m'),
  relativehumidity_2m('relativehumidity_2m');

  const CurrentOptions(this.value);

  factory CurrentOptions.fromString(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => CurrentOptions.values.first,
    );
  }

  final String value;

  @override
  String toString() => value;
}

class RemoteDataSource {
  final String baseUrl = 'api.open-meteo.com';
  final String endpoint = 'v1/forecast';

  // void getCurrentAndHourly(double lat, double long) async {
  //   final url = Uri.https(baseUrl, endpoint, {
  //     'latitude': '52.5200',
  //     'longitude': '13.4050',
  //     'current': ['temperature_2m', 'windspeed_10m'],
  //     'hourly': ['temperature_2m', 'relativehumidity_2m', 'windspeed_10m'],
  //   });

  //   var response = await http.get(url);
  //   final map = jsonDecode(response.body);
  //   print(map);
  //   final fc = ForecastCurrentAndHourly.fromJson(map);
  //   print(fc);
  // }

  Future<Forecast> getForecastCurrent(double lat, double long,
      [List<CurrentOptions> options = const []]) async {
    final queryParams = <String, dynamic>{
      'timeformat': 'unixtime',
      'latitude': '$lat',
      'longitude': '$long',
    };

    if (options.isNotEmpty) {
      queryParams['current'] = options.map((e) => e.value.toString());
    }

    final url = Uri.https(baseUrl, endpoint, queryParams);

    var response = await http.get(url);
    final map = jsonDecode(response.body);
    return Forecast.fromJson(map);
  }

  Future<Forecast> getForecastHourly(double lat, double long,
      [List<CurrentOptions> options = const []]) async {
    final queryParams = <String, dynamic>{
      'timeformat': 'unixtime',
      'latitude': '$lat',
      'longitude': '$long',
    };

    if (options.isNotEmpty) {
      queryParams['hourly'] = options.map((e) => e.value.toString());
    }

    final url = Uri.https(baseUrl, endpoint, queryParams);

    var response = await http.get(url);
    final map = jsonDecode(response.body);
    return Forecast.fromJson(map);
  }

  Future<Forecast> getForecast(double lat, double long,
      {List<CurrentOptions> current = const [],
      List<CurrentOptions> hourly = const []}) async {
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
    final map = jsonDecode(response.body);
    return Forecast.fromJson(map);
  }
}
