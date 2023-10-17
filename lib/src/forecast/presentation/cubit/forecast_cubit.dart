import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';
import 'package:anemoi_weather/src/forecast/domain/usecases/fetch_forecast.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location_collection.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final FetchForecast _fetchForecast;

  ForecastCubit({required FetchForecast fetchForecast})
      : _fetchForecast = fetchForecast,
        super(const ForecastStateLoading());

  Future<void> loadForecast(UserLocationCollection collection) async {
    if (collection.isNotEmpty) {
      emit(const ForecastStateLoading());
      final result = await _fetchForecast(collection.selected);
      result.fold(
          (l) => emit(const ForecastStateError()),
          (r) => emit(ForecastStateLoaded(
              userLocation: collection.selected, forecast: r)));
    }
  }
}
