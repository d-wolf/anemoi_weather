import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/search_location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/location/domain/repositories/saved_locations_repository.dart';

class GetSavedLocationsOrEmpty
    extends UsecaseWithoutParams<List<GeocodingSearchResult>> {
  final SavedLocationsRepository _repo;

  GetSavedLocationsOrEmpty(this._repo);

  @override
  ResultFuture<List<GeocodingSearchResult>> call() async {
    return _repo.read();
  }
}
