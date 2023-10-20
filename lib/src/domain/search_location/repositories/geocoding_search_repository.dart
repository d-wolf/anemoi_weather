import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/search_location/entities/geocoding_search_results.dart';

abstract class GeocodingSearchRepository {
  ResultFuture<GeocodingSearchResults> search(
    String name,
    int count,
    String languageCode,
  );
}
