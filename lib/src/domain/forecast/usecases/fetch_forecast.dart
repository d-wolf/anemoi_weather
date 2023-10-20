import 'package:anemoi_weather/src/domain/forecast/entities/forecast.dart';
import 'package:anemoi_weather/src/domain/forecast/enums/enums.dart';
import 'package:anemoi_weather/src/domain/forecast/repositories/forecast_repository.dart';
import 'package:anemoi_weather/src/domain/location/entities/user_location.dart';
import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';

class FetchForecast extends UsecaseWithParams<Forecast, UserLocation> {
  final ForecastRepository _repo;

  FetchForecast(this._repo);

  @override
  ResultFuture<Forecast> call(UserLocation params) {
    return _repo.getForecast(params.lat, params.long, current: [
      CurrentParameters.temperature2M,
      CurrentParameters.windspeed10M,
      CurrentParameters.relativehumidity2M,
      CurrentParameters.weathercode,
      CurrentParameters.precipitation,
    ], hourly: [
      HourlyParameters.temperature2M,
      HourlyParameters.windspeed10M,
      HourlyParameters.relativehumidity2M,
      HourlyParameters.weathercode,
      HourlyParameters.precipitation,
      HourlyParameters.precipitationProbability,
    ]);
  }
}
