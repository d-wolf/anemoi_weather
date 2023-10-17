import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/data/datasources/location_local_data_source.dart';
import 'package:anemoi_weather/src/location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/location/domain/failures/failure.dart';
import 'package:anemoi_weather/src/location/domain/repositories/saved_locations_repository.dart';
import 'package:dartz/dartz.dart';

class SavedLocationsRepositoryImpl implements SavedLocationsRepository {
  final LocationsLocalDataSource _localDataSource;

  SavedLocationsRepositoryImpl(this._localDataSource);

  @override
  ResultFuture<void> addOrUpdate(GeocodingSearchResult value) async {
    try {
      await _localDataSource.addOrUpdate(value);
      return right(null);
    } catch (e) {
      return left(StorageFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> clear() async {
    try {
      await _localDataSource.clear();
      return right(null);
    } catch (e) {
      return left(StorageFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> delete(GeocodingSearchResult value) async {
    try {
      await _localDataSource.delete(value);
      return right(null);
    } catch (e) {
      return left(StorageFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<bool> exists() {
    try {
      final result = _localDataSource.exists();
      return Future.value(right(result));
    } catch (e) {
      return Future.value(left(StorageFailure(message: e.toString())));
    }
  }

  @override
  ResultFuture<List<GeocodingSearchResult>> read() {
    try {
      final result = _localDataSource.read();
      return Future.value(right(result));
    } catch (e) {
      return Future.value(left(StorageFailure(message: e.toString())));
    }
  }
}
