import 'dart:convert';

import 'package:anemoi_weather/src/forecast/data/api_strings.dart';
import 'package:anemoi_weather/src/forecast/data/models/forecast_model.dart';
import 'package:anemoi_weather/src/forecast/data/utils/enum_extensions.dart';
import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';
import 'package:anemoi_weather/src/forecast/domain/enums/enums.dart';
import 'package:http/http.dart' as http;

abstract class ForecastRemoteDataSource {
  Future<Forecast> getForecast(double lat, double long,
      {TimeZone tz = TimeZone.auto,
      List<CurrentParameters> current = const [],
      List<HourlyParameters> hourly = const [],
      List<DailyParameters> daily = const []});
}

class ForecastRemoteDataSourceImpl implements ForecastRemoteDataSource {
  final String baseUrl = 'api.open-meteo.com';
  final String endpoint = 'v1/forecast';

  @override
  Future<Forecast> getForecast(double lat, double long,
      {TimeZone tz = TimeZone.auto,
      List<CurrentParameters> current = const [],
      List<HourlyParameters> hourly = const [],
      List<DailyParameters> daily = const []}) async {
    final queryParams = <String, dynamic>{
      ApiStrings.timeformat: 'unixtime',
      ApiStrings.timezone: tz.value,
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
    final forecast = ForecastModel.fromJson(map);
    return forecast;
  }
}
