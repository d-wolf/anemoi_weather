import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/domain/settings/entities/settings.dart';
import 'package:anemoi_weather/src/domain/settings/repositories/settings_repository.dart';

class SaveSettings extends UsecaseWithParams<void, Settings> {
  SaveSettings(this._repo);
  final SettingsRepository _repo;

  @override
  ResultFuture<void> call(Settings params) async {
    return _repo.saveSettings(params);
  }
}
