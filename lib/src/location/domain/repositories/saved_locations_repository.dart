import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/search_location/domain/entities/geocoding_search_results.dart';

abstract class SavedLocationsRepository {
  ResultFuture<bool> exists();
  ResultFuture<void> addOrUpdate(GeocodingSearchResult value);
  ResultFuture<List<GeocodingSearchResult>> read();
  ResultFuture<void> delete(GeocodingSearchResult value);
  ResultFuture<void> clear();
}
