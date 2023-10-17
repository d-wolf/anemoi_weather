import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';
import 'package:anemoi_weather/src/forecast/domain/enums/enums.dart';

abstract class ForecastRepository {
  Future<Forecast> getForecast(double lat, double long,
      {TimeZone tz = TimeZone.auto,
      List<CurrentParameters> current = const [],
      List<HourlyParameters> hourly = const [],
      List<DailyParameters> daily = const []});
}
