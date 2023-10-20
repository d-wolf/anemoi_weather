import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/domain/location/entities/user_location_collection.dart';
import 'package:anemoi_weather/src/domain/location/repositories/user_locations_repository.dart';

class GetAllLocations extends UsecaseWithoutParams<UserLocationCollection> {
  final UserLocationsRepository _repo;

  GetAllLocations(this._repo);

  @override
  ResultFuture<UserLocationCollection> call() async {
    return _repo.getAll();
  }
}
