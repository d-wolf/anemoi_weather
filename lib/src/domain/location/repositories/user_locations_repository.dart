import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/domain/location/entities/user_location.dart';
import 'package:anemoi_weather/src/domain/location/entities/user_location_collection.dart';

abstract class UserLocationsRepository {
  ResultFuture<UserLocationCollection> add(UserLocation value);
  ResultFuture<UserLocationCollection> getAll();
  ResultFuture<UserLocationCollection> delete(UserLocation value);
  ResultFuture<UserLocationCollection> setSelected(UserLocation value);
  ResultFuture<UserLocation?> getSelected();
}
