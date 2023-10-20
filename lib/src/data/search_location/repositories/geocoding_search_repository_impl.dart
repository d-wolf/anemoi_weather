import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/data/search_location/datasources/geocoding_remote_data_source.dart';
import 'package:anemoi_weather/src/domain/search_location/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/domain/search_location/failures/failure.dart';
import 'package:anemoi_weather/src/domain/search_location/repositories/geocoding_search_repository.dart';
import 'package:dartz/dartz.dart';

class GeocodingSearchRepositoryImpl implements GeocodingSearchRepository {
  GeocodingSearchRepositoryImpl(this._remoteDataSource);
  final GeocodingRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<GeocodingSearchResults> search(
    String name,
    int count,
    String languageCode,
  ) async {
    try {
      final result = await _remoteDataSource.search(name, count, languageCode);
      return right(result);
    } catch (e) {
      return left(GeocodingApiFailure(message: e.toString()));
    }
  }
}
