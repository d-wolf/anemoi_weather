import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/forecast/data/datasources/forecast_remote_data_source.dart';
import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';
import 'package:anemoi_weather/src/forecast/domain/enums/enums.dart';
import 'package:anemoi_weather/src/forecast/domain/failures/failure.dart';
import 'package:anemoi_weather/src/forecast/domain/repositories/forecast_repository.dart';
import 'package:dartz/dartz.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastRemoteDataSource _remoteDataSource;

  ForecastRepositoryImpl(this._remoteDataSource);

  @override
  ResultFuture<Forecast> getForecast(double lat, double long,
      {TimeZone tz = TimeZone.auto,
      List<CurrentParameters> current = const [],
      List<HourlyParameters> hourly = const [],
      List<DailyParameters> daily = const []}) async {
    try {
      final result = await _remoteDataSource.getForecast(
        lat,
        long,
        current: current,
        hourly: hourly,
        daily: daily,
      );

      return right(result);
    } catch (e) {
      rethrow;
      return left(ForecastApiFailure(message: e.toString()));
    }
  }
}
