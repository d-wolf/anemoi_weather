import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/location/domain/repositories/saved_locations_repository.dart';

class DeleteLocation extends UsecaseWithParams<void, GeocodingSearchResult> {
  final SavedLocationsRepository _repo;

  DeleteLocation(this._repo);

  @override
  ResultFuture<void> call(GeocodingSearchResult params) async {
    return _repo.delete(params);
  }
}
