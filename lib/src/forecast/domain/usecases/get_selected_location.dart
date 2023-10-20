import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';
import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/domain/repositories/user_locations_repository.dart';

class GetSelectedLocation extends UsecaseWithoutParams<UserLocation?> {
  final UserLocationsRepository _repo;

  GetSelectedLocation(this._repo);

  @override
  ResultFuture<UserLocation?> call() async {
    return _repo.getSelected();
  }
}
