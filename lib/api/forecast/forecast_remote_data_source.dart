import 'dart:convert';

import 'package:anemoi_weather/api/forecast/api_strings.dart';
import 'package:anemoi_weather/api/forecast/current/enums.dart';
import 'package:anemoi_weather/api/forecast/daily/enums.dart';
import 'package:anemoi_weather/api/forecast/enums.dart';
import 'package:anemoi_weather/api/forecast/forecast.dart';
import 'package:anemoi_weather/api/forecast/hourly/enums.dart';
import 'package:http/http.dart' as http;

class ForecastRemoteDataSource {
  final String baseUrl = 'api.open-meteo.com';
  final String endpoint = 'v1/forecast';

  Future<Forecast> getForecast(double lat, double long,
      {TimeZone tz = TimeZone.auto,
      List<CurrentParameters> current = const [],
      List<HourlyParameters> hourly = const [],
      List<DailyParameters> daily = const []}) async {
    final queryParams = <String, dynamic>{
      ApiStrings.timeformat: 'unixtime',
      ApiStrings.timezone: '$tz',
      ApiStrings.latitude: '$lat',
      ApiStrings.longitude: '$long',
    };

    if (current.isNotEmpty) {
      queryParams[ApiStrings.current] = current.map((e) => e.value.toString());
    }

    if (hourly.isNotEmpty) {
      queryParams[ApiStrings.hourly] = hourly.map((e) => e.value.toString());
    }

    if (daily.isNotEmpty) {
      queryParams[ApiStrings.daily] = daily.map((e) => e.value.toString());
    }

    final url = Uri.https(baseUrl, endpoint, queryParams);
    final response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    final forecast = Forecast.fromJson(map);
    return forecast;
  }
}
