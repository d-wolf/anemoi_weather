import 'package:anemoi_weather/src/location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/location/domain/usecases/search_location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchStateUpdate> {
  final SearchLocation _searchLocation;
  SearchBloc({required SearchLocation searchLocation})
      : _searchLocation = searchLocation,
        super(const SearchStateUpdate(results: [])) {
    on<SearchEventInput>(_handleSearchInput);
  }

  Future<void> _handleSearchInput(
      SearchEventInput event, Emitter<SearchStateUpdate> emit) async {
    print('_handleSearchInput');

    if (event.input.isEmpty) {
      emit(const SearchStateUpdate(results: []));
    } else {
      final result = await _searchLocation(SearchLocationParams(
          name: event.input, count: 10, languageCode: 'en'));
      result.fold((l) {
        print(l);
      }, (r) {
        emit(SearchStateUpdate(results: r.results));
      });
    }
  }
}
