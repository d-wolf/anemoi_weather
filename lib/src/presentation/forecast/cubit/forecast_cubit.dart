import 'package:anemoi_weather/src/domain/forecast/entities/forecast.dart';
import 'package:anemoi_weather/src/domain/forecast/usecases/fetch_forecast.dart';
import 'package:anemoi_weather/src/domain/manage_locations/entities/user_location.dart';
import 'package:anemoi_weather/src/domain/manage_locations/entities/user_location_collection.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit({required FetchForecast fetchForecast})
      : _fetchForecast = fetchForecast,
        super(const ForecastStateLoading());
  final FetchForecast _fetchForecast;

  Future<void> load(UserLocationCollection collection) async {
    if (collection.isNotEmpty) {
      emit(const ForecastStateLoading());
      final result = await _fetchForecast(collection.selected);
      result.fold(
        (l) => emit(const ForecastStateError()),
        (r) => emit(
          ForecastStateLoaded(
            lastUpdated: DateTime.timestamp(),
            userLocation: collection.selected,
            forecast: r,
          ),
        ),
      );
    } else {
      emit(const ForecastStateNoLocation());
    }
  }

  Future<void> reload() async {
    switch (state) {
      case ForecastStateLoading():
        break;
      case ForecastStateLoaded(userLocation: final userLocation):
        emit(const ForecastStateLoading());
        final result = await _fetchForecast(userLocation);
        result.fold(
          (l) => emit(const ForecastStateError()),
          (r) => emit(
            ForecastStateLoaded(
              lastUpdated: DateTime.timestamp(),
              userLocation: userLocation,
              forecast: r,
            ),
          ),
        );
      case ForecastStateNoLocation():
        break;
      case ForecastStateError():
        break;
    }
  }
}
