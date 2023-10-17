import 'package:anemoi_weather/src/forecast/data/datasources/forecast_remote_data_source.dart';
import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';
import 'package:anemoi_weather/src/forecast/domain/enums/enums.dart';
import 'package:anemoi_weather/src/forecast/domain/repositories/forecast_repository.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastRemoteDataSource _remoteDataSource;

  ForecastRepositoryImpl(this._remoteDataSource);

  @override
  Future<Forecast> getForecast(double lat, double long,
      {TimeZone tz = TimeZone.auto,
      List<CurrentParameters> current = const [],
      List<HourlyParameters> hourly = const [],
      List<DailyParameters> daily = const []}) async {
    return _remoteDataSource.getForecast(
      lat,
      long,
      current: current,
      hourly: hourly,
      daily: daily,
    );
  }
}
