part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

final class HasNoSavedLocationState extends LocationState {
  const HasNoSavedLocationState();

  @override
  List<Object?> get props => [];
}

final class SavedLocationState extends LocationState {
  final int selectedId;
  final List<GeocodingSearchResult> locations;

  const SavedLocationState({required this.selectedId, required this.locations});

  @override
  List<Object?> get props => [selectedId, locations];
}

final class ErrorLocationState extends LocationState {
  const ErrorLocationState();

  @override
  List<Object?> get props => [];
}
