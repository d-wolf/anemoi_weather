import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';
import 'package:anemoi_weather/src/forecast/domain/usecases/fetch_forecast.dart';
import 'package:anemoi_weather/src/forecast/domain/usecases/get_selected_location.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location_collection.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final GetSelectedLocation _getSelectedLocation;
  final FetchForecast _fetchForecast;

  ForecastCubit(
      {required GetSelectedLocation getSelectedLocation,
      required FetchForecast fetchForecast})
      : _getSelectedLocation = getSelectedLocation,
        _fetchForecast = fetchForecast,
        super(const ForecastStateLoading());

  Future<void> load(UserLocationCollection collection) async {
    if (collection.isNotEmpty) {
      emit(const ForecastStateLoading());
      final result = await _fetchForecast(collection.selected);
      result.fold(
          (l) => emit(const ForecastStateError()),
          (r) => emit(ForecastStateLoaded(
              lastUpdated: DateTime.timestamp(),
              userLocation: collection.selected,
              forecast: r)));
    } else {
      emit(const ForecastStateNoLocation());
    }
  }

  Future<void> reload() async {
    emit(const ForecastStateLoading());
    final getLocationResult = await _getSelectedLocation();

    getLocationResult.fold((l) => emit(const ForecastStateError()),
        (locationOrNull) async {
      if (locationOrNull == null) {
        emit(const ForecastStateNoLocation());
      } else {
        final result = await _fetchForecast(locationOrNull);
        result.fold(
          (l) => emit(const ForecastStateError()),
          (r) => emit(
            ForecastStateLoaded(
                lastUpdated: DateTime.timestamp(),
                userLocation: locationOrNull,
                forecast: r),
          ),
        );
      }
    });
  }
}
