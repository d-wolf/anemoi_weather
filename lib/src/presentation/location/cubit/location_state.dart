part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

final class LocationStateLoading extends LocationState {
  const LocationStateLoading();

  @override
  List<Object?> get props => [];
}

final class LocationsStateLoaded extends LocationState {
  final UserLocationCollection collection;

  const LocationsStateLoaded({required this.collection});

  @override
  List<Object?> get props => [collection];
}

final class LocationStateError extends LocationState {
  const LocationStateError();

  @override
  List<Object?> get props => [];
}
