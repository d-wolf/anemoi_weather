part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object?> get props => [];
}

class SearchStateSearching extends SearchState {
  const SearchStateSearching();

  @override
  List<Object?> get props => [];
}

class SearchStateUpdate extends SearchState {
  const SearchStateUpdate({required this.results});
  final List<GeocodingSearchResult> results;

  @override
  List<Object?> get props => [results];
}
