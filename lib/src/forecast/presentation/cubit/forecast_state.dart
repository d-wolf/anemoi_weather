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
  final Forecast forecast;

  const ForecastStateLoaded({
    required this.forecast,
  });

  @override
  List<Object?> get props => [forecast];
}

class ForecastStateError extends ForecastState {
  const ForecastStateError();

  @override
  List<Object?> get props => [];
}
