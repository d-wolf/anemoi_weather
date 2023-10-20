import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/domain/location/entities/user_location.dart';
import 'package:anemoi_weather/src/domain/location/entities/user_location_collection.dart';
import 'package:anemoi_weather/src/domain/location/repositories/user_locations_repository.dart';

class SelectLocation
    extends UsecaseWithParams<UserLocationCollection, UserLocation> {
  SelectLocation(this._repo);
  final UserLocationsRepository _repo;

  @override
  ResultFuture<UserLocationCollection> call(UserLocation params) async {
    return _repo.setSelected(params);
  }
}
