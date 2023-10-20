import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/forecast.dart';
import 'package:anemoi_weather/src/domain/forecast/enums/enums.dart';

abstract class ForecastRepository {
  ResultFuture<Forecast> getForecast(
    double lat,
    double long, {
    TimeZone tz = TimeZone.auto,
    List<CurrentParameters> current = const [],
    List<HourlyParameters> hourly = const [],
    List<DailyParameters> daily = const [],
  });
}
