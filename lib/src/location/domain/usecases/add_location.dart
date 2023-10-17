import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/search_location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/location/domain/repositories/saved_locations_repository.dart';
import 'package:equatable/equatable.dart';

class AddLocation extends UsecaseWithParams<void, GeocodingSearchResult> {
  final SavedLocationsRepository _repo;

  AddLocation(this._repo);

  @override
  ResultFuture<void> call(GeocodingSearchResult params) async {
    return _repo.addOrUpdate(params);
  }
}

class SearchLocationParams extends Equatable {
  final String name;
  final int count;
  final String languageCode;

  const SearchLocationParams({
    required this.name,
    required this.count,
    required this.languageCode,
  });

  @override
  List<Object?> get props => [];
}