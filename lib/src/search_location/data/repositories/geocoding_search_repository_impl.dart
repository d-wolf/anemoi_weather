import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/search_location/data/datasources/geocoding_remote_data_source.dart';
import 'package:anemoi_weather/src/search_location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/search_location/domain/repositories/geocoding_search_repository.dart';
import 'package:anemoi_weather/src/search_location/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

class GeocodingSearchRepositoryImpl implements GeocodingSearchRepository {
  final GeocodingRemoteDataSource _remoteDataSource;

  GeocodingSearchRepositoryImpl(this._remoteDataSource);

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
