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
  final List<GeocodingSearchResult> results;
  const SearchStateUpdate({required this.results});

  @override
  List<Object?> get props => [results];
}
