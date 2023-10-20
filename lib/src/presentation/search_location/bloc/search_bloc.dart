import 'package:anemoi_weather/src/domain/search_location/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/domain/search_location/usecases/search_location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required SearchLocation searchLocation})
      : _searchLocation = searchLocation,
        super(const SearchStateUpdate(results: [])) {
    on<SearchEventInput>(_handleSearchInput);
  }
  final SearchLocation _searchLocation;

  Future<void> _handleSearchInput(
    SearchEventInput event,
    Emitter<SearchState> emit,
  ) async {
    if (event.input.isEmpty) {
      emit(const SearchStateUpdate(results: []));
    } else {
      emit(const SearchStateSearching());
      final result = await _searchLocation(
        SearchLocationParams(
          name: event.input,
          count: 10,
          languageCode: 'en',
        ),
      );
      result.fold((l) {
        emit(const SearchStateUpdate(results: []));
      }, (r) {
        emit(SearchStateUpdate(results: r.results));
      });
    }
  }
}
