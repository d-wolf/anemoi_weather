import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';
import 'package:anemoi_weather/src/forecast/domain/usecases/fetch_forecast.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final FetchForecast _fetchForecast;

  ForecastCubit({required FetchForecast fetchForecast})
      : _fetchForecast = fetchForecast,
        super(const ForecastStateLoading());

  void loadForecast(UserLocation userLocation) async {
    final result = await _fetchForecast(userLocation);
    result.fold((l) => emit(const ForecastStateError()),
        (r) => emit(ForecastStateLoaded(forecast: r)));
  }
}
