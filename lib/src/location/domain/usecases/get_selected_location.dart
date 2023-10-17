import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/domain/repositories/selected_location_repository.dart';

class GetSelectedLocation extends UsecaseWithoutParams<int> {
  final SelectedLocationRepository _repo;

  GetSelectedLocation(this._repo);

  @override
  ResultFuture<int> call() async {
    return _repo.read();
  }
}
