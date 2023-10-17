import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location_collection.dart';
import 'package:anemoi_weather/src/location/domain/repositories/user_locations_repository.dart';

class SelectLocation
    extends UsecaseWithParams<UserLocationCollection, UserLocation> {
  final UserLocationsRepository _repo;

  SelectLocation(this._repo);

  @override
  ResultFuture<UserLocationCollection> call(UserLocation params) async {
    return _repo.setSelected(params);
  }
}
