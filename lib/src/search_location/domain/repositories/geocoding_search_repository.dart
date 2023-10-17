import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/search_location/domain/entities/geocoding_search_results.dart';

abstract class GeocodingSearchRepository {
  ResultFuture<GeocodingSearchResults> search(
    String name,
    int count,
    String languageCode,
  );
}
