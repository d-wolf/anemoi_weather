import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/domain/manage_locations/entities/user_location.dart';
import 'package:anemoi_weather/src/domain/manage_locations/entities/user_location_collection.dart';
import 'package:anemoi_weather/src/domain/manage_locations/repositories/user_locations_repository.dart';

class AddLocation
    extends UsecaseWithParams<UserLocationCollection, UserLocation> {
  AddLocation(this._repo);
  final UserLocationsRepository _repo;

  @override
  ResultFuture<UserLocationCollection> call(UserLocation params) async {
    return _repo.add(params);
  }
}
