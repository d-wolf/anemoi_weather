import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit() : super(const ForecastStateLoading());
}
