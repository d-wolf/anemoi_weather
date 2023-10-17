import 'package:anemoi_weather/src/location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/location/domain/usecases/get_saved_locations_or_empty.dart';
import 'package:anemoi_weather/src/location/domain/usecases/get_selected_location.dart';
import 'package:anemoi_weather/src/location/domain/usecases/search_location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetSavedLocationsOrEmpty _getSavedLocations;
  final GetSelectedLocation _getSelectedLocation;
  final SearchLocation _searchLocation;

  LocationCubit({
    required GetSavedLocationsOrEmpty getSavedLocations,
    required GetSelectedLocation getSelectedLocation,
    required SearchLocation searchLocation,
  })  : _getSavedLocations = getSavedLocations,
        _getSelectedLocation = getSelectedLocation,
        _searchLocation = searchLocation,
        super(const HasNoSavedLocationState());

  Future<void> loadSavedLocations() async {
    final result = await _getSavedLocations();
    result.fold((l) => emit(const ErrorLocationState()),
        (savedLocations) async {
      if (savedLocations.isEmpty) {
        emit(const HasNoSavedLocationState());
      } else {
        final selectedResult = await _getSelectedLocation();
        selectedResult.fold(
            (l) => emit(const ErrorLocationState()),
            (selectedId) => emit(LocationsLoadedState(
                selectedId: selectedId, locations: savedLocations)));
      }
    });
  }

  Future<void> searchLocation(String name) async {
    final result = await _searchLocation(
        SearchLocationParams(name: name, count: 10, languageCode: 'en'));

    result.fold((l) => emit(const ErrorLocationState()), (r) => null);
  }
}
