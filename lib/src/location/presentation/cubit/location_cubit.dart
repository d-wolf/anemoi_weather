import 'package:anemoi_weather/src/forecast/presentation/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location_collection.dart';
import 'package:anemoi_weather/src/location/domain/usecases/add_location.dart';
import 'package:anemoi_weather/src/location/domain/usecases/delete_location.dart';
import 'package:anemoi_weather/src/location/domain/usecases/select_location.dart';
import 'package:anemoi_weather/src/search_location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/location/domain/usecases/get_all_locations.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final AddLocation _addLocation;
  final DeleteLocation _deleteLocation;
  final GetAllLocations _getAllLocations;
  final SelectLocation _selectLocation;

  LocationCubit({
    required AddLocation addLocation,
    required DeleteLocation deleteLocation,
    required GetAllLocations getAllLocations,
    required SelectLocation selectLocation,
  })  : _addLocation = addLocation,
        _deleteLocation = deleteLocation,
        _getAllLocations = getAllLocations,
        _selectLocation = selectLocation,
        super(const LocationStateLoading());

  Future<void> loadLocations() async {
    final result = await _getAllLocations();
    result.fold((l) => emit(const LocationStateError()), (r) {
      emit(LocationsStateLoaded(collection: r));
    });
  }

  Future<void> addLocation(
      GeocodingSearchResult value, ForecastCubit forecastCubit) async {
    final result = await _addLocation(UserLocation(
      uuid: const Uuid().v4(),
      lat: value.latitude,
      long: value.longitude,
      name: value.name,
      tag: '${value.country}, ${value.admin1}',
    ));

    result.fold((l) => emit(const LocationStateError()), (r) {
      forecastCubit.loadForecast();
      emit(LocationsStateLoaded(collection: r));
    });
  }

  Future<void> deleteLocation(
      UserLocation value, ForecastCubit forecastCubit) async {
    final result = await _deleteLocation(value);
    result.fold((l) => emit(const LocationStateError()), (r) {
      emit(LocationsStateLoaded(collection: r));
    });
  }

  Future<void> selectLocation(
      UserLocation value, ForecastCubit forecastCubit) async {
    final result = await _selectLocation(value);
    result.fold((l) => emit(const LocationStateError()), (r) {
      emit(LocationsStateLoaded(collection: r));
    });
  }
}
