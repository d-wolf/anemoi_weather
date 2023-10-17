part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchEventInput extends SearchEvent {
  final String input;

  const SearchEventInput({required this.input});

  @override
  List<Object?> get props => [input];
}
