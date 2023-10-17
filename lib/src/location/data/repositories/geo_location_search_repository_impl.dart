import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/data/datasources/geocoding_remote_data_source.dart';
import 'package:anemoi_weather/src/location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/location/domain/failures/failure.dart';
import 'package:anemoi_weather/src/location/domain/repositories/geo_location_search_repository.dart';
import 'package:dartz/dartz.dart';

class GeolocationSearchRepositoryImpl implements GeoLocationSearchRepository {
  final GeocodingRemoteDataSource _remoteDataSource;

  GeolocationSearchRepositoryImpl(this._remoteDataSource);

  @override
  ResultFuture<GeocodingSearchResults> search(
      String name, int count, String languageCode) async {
    try {
      final result = await _remoteDataSource.search(name, count, languageCode);
      return right(result);
    } catch (e) {
      return left(GeocodingApiFailure(message: e.toString()));
    }
  }
}
