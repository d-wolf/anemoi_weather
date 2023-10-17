import 'package:anemoi_weather/src/forecast/domain/repositories/forecast_repository.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';
import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';

class FetchForecast extends UsecaseWithParams<Forecast, UserLocation> {
  final ForecastRepository _repo;

  FetchForecast(this._repo);

  @override
  ResultFuture<Forecast> call(UserLocation params) {
    return _repo.getForecast(params.lat, params.long);
  }
}
