import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/data/forecast/datasources/forecast_remote_data_source.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/forecast.dart';
import 'package:anemoi_weather/src/domain/forecast/enums/enums.dart';
import 'package:anemoi_weather/src/domain/forecast/failures/failure.dart';
import 'package:anemoi_weather/src/domain/forecast/repositories/forecast_repository.dart';
import 'package:dartz/dartz.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  ForecastRepositoryImpl(this._remoteDataSource);
  final ForecastRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<Forecast> getForecast(
    double lat,
    double long, {
    TimeZone tz = TimeZone.auto,
    List<CurrentParameters> current = const [],
    List<HourlyParameters> hourly = const [],
    List<DailyParameters> daily = const [],
  }) async {
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
      return left(ForecastApiFailure(message: e.toString()));
    }
  }
}
