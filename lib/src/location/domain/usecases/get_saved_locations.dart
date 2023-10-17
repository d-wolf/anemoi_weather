import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/location/domain/repositories/saved_locations_repository.dart';

class GetSavedLocations
    extends UsecaseWithoutParams<List<GeocodingSearchResult>> {
  final SavedLocationsRepository _repo;

  GetSavedLocations(this._repo);

  @override
  ResultFuture<List<GeocodingSearchResult>> call() async {
    return _repo.read();
  }
}
