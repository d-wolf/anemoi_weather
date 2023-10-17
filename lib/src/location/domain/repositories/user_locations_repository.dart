import 'package:anemoi_weather/src/location/domain/entities/geocoding_search_results.dart';

abstract class UserLocationsRepository {
  bool exists();
  Future<bool> write(GeocodingSearchResult geo);
  List<GeocodingSearchResult> read();
}
