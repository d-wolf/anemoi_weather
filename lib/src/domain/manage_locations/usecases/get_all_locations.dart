import 'package:anemoi_weather/src/domain/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/manage_locations/entities/user_location_collection.dart';
import 'package:anemoi_weather/src/domain/manage_locations/repositories/user_locations_repository.dart';

class GetAllLocations extends UsecaseWithoutParams<UserLocationCollection> {
  GetAllLocations(this._repo);
  final UserLocationsRepository _repo;

  @override
  ResultFuture<UserLocationCollection> call() async {
    return _repo.getAll();
  }
}
