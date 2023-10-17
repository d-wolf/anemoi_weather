import 'package:anemoi_weather/src/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/domain/repositories/selected_location_repository.dart';

class SetSelectedLocation extends UsecaseWithParams<void, int> {
  final SelectedLocationRepository _repo;

  SetSelectedLocation(this._repo);

  @override
  ResultFuture<void> call(int params) async {
    return _repo.write(params);
  }
}
