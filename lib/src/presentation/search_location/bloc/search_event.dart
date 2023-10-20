part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchEventInput extends SearchEvent {
  final String languageCode;
  final String input;

  const SearchEventInput({
    required this.input,
    required this.languageCode,
  });

  @override
  List<Object?> get props => [input];
}
