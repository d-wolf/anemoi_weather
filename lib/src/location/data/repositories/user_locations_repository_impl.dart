import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/data/datasources/locations_local_data_source.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location_collection.dart';
import 'package:anemoi_weather/src/location/domain/repositories/user_locations_repository.dart';
import 'package:anemoi_weather/src/location/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class UserLocationsRepositoryImpl implements UserLocationsRepository {
  final UserLocationsLocalDataSource _localDataSource;

  UserLocationsRepositoryImpl(this._localDataSource);

  @override
  ResultFuture<UserLocationCollection> add(UserLocation value) async {
    try {
      final result = await _localDataSource.add(value);
      return right(result);
    } catch (e) {
      debugPrint(e.toString());
      return left(StorageFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<UserLocationCollection> delete(UserLocation value) async {
    try {
      final result = await _localDataSource.delete(value);
      return right(result);
    } catch (e) {
      debugPrint(e.toString());
      return left(StorageFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<UserLocationCollection> getAll() {
    try {
      final result = _localDataSource.getAll();
      return Future.value(right(result));
    } catch (e) {
      debugPrint(e.toString());
      return Future.value(left(StorageFailure(message: e.toString())));
    }
  }

  @override
  ResultFuture<UserLocationCollection> setSelected(UserLocation value) async {
    try {
      final result = await _localDataSource.setSelected(value);
      return right(result);
    } catch (e) {
      debugPrint(e.toString());
      return left(StorageFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<UserLocation?> getSelected() {
    try {
      final result = _localDataSource.getSelected();
      return Future.value(right(result));
    } catch (e) {
      debugPrint(e.toString());
      return Future.value(left(StorageFailure(message: e.toString())));
    }
  }
}
