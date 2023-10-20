part of 'forecast_cubit.dart';

sealed class ForecastState extends Equatable {
  const ForecastState();

  @override
  List<Object?> get props => [];
}

class ForecastStateLoading extends ForecastState {
  const ForecastStateLoading();

  @override
  List<Object?> get props => [];
}

class ForecastStateLoaded extends ForecastState {
  const ForecastStateLoaded({
    required this.lastUpdated,
    required this.forecast,
    required this.userLocation,
  });
  final DateTime lastUpdated;
  final UserLocation userLocation;
  final Forecast forecast;

  @override
  List<Object?> get props => [forecast, userLocation];
}

class ForecastStateNoLocation extends ForecastState {
  const ForecastStateNoLocation();

  @override
  List<Object?> get props => [];
}

class ForecastStateError extends ForecastState {
  const ForecastStateError();

  @override
  List<Object?> get props => [];
}
