import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/data/datasources/selected_location_local_data_source.dart';
import 'package:anemoi_weather/src/location/domain/failures/failure.dart';
import 'package:anemoi_weather/src/location/domain/repositories/selected_location_repository.dart';
import 'package:dartz/dartz.dart';

class SelectedLocationRepositoryImpl implements SelectedLocationRepository {
  final SelectedLocationLocalDataSource _localDataSource;

  SelectedLocationRepositoryImpl(this._localDataSource);

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
  ResultFuture<bool> exists() {
    try {
      final result = _localDataSource.exists();
      return Future.value(right(result));
    } catch (e) {
      return Future.value(left(StorageFailure(message: e.toString())));
    }
  }

  @override
  ResultFuture<int> read() {
    try {
      final result = _localDataSource.read();
      return Future.value(right(result));
    } catch (e) {
      return Future.value(left(StorageFailure(message: e.toString())));
    }
  }

  @override
  ResultFuture<void> write(int id) async {
    try {
      await _localDataSource.write(id);
      return right(null);
    } catch (e) {
      return left(StorageFailure(message: e.toString()));
    }
  }
}
