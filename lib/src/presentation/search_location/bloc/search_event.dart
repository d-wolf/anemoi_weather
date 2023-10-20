part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchEventInput extends SearchEvent {
  const SearchEventInput({
    required this.input,
    required this.languageCode,
  });
  final String languageCode;
  final String input;

  @override
  List<Object?> get props => [input];
}
