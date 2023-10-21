// ignore_for_file: one_member_abstracts

import 'dart:convert';

import 'package:anemoi_weather/src/data/forecast/api_strings.dart';
import 'package:anemoi_weather/src/data/forecast/models/forecast_model.dart';
import 'package:anemoi_weather/src/data/forecast/utils/enum_extensions.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/forecast.dart';
import 'package:anemoi_weather/src/domain/forecast/enums/enums.dart';
import 'package:http/http.dart' as http;

abstract class ForecastRemoteDataSource {
  Future<Forecast> getForecast(
    double lat,
    double long, {
    TimeZone tz = TimeZone.auto,
    List<CurrentParameters> current = const [],
    List<HourlyParameters> hourly = const [],
    List<DailyParameters> daily = const [],
  });
}

class ForecastRemoteDataSourceImpl implements ForecastRemoteDataSource {
  ForecastRemoteDataSourceImpl(this._client);
  final String baseUrl = 'api.open-meteo.com';
  final String endpoint = 'v1/forecast';

  final http.Client _client;

  @override
  Future<Forecast> getForecast(
    double lat,
    double long, {
    TimeZone tz = TimeZone.auto,
    List<CurrentParameters> current = const [],
    List<HourlyParameters> hourly = const [],
    List<DailyParameters> daily = const [],
  }) async {
    final queryParams = <String, dynamic>{
      ApiStrings.timeformat: 'unixtime',
      ApiStrings.timezone: tz.value,
      ApiStrings.latitude: '$lat',
      ApiStrings.longitude: '$long',
    };

    if (current.isNotEmpty) {
      queryParams[ApiStrings.current] = current.map((e) => e.value);
    }

    if (hourly.isNotEmpty) {
      queryParams[ApiStrings.hourly] = hourly.map((e) => e.value);
    }

    if (daily.isNotEmpty) {
      queryParams[ApiStrings.daily] = daily.map((e) => e.value);
    }

    final url = Uri.https(baseUrl, endpoint, queryParams);
    final response = await _client.get(url);
    final map = jsonDecode(response.body) as DataMap;
    final forecast = ForecastModel.fromJson(map);
    return forecast;
  }
}
