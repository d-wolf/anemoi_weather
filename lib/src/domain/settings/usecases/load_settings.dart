import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/core/usecase/usecase.dart';
import 'package:anemoi_weather/src/domain/settings/entities/settings.dart';
import 'package:anemoi_weather/src/domain/settings/repositories/settings_repository.dart';

class LoadSettings extends UsecaseWithoutParams<Settings> {
  LoadSettings(this._repo);
  final SettingsRepository _repo;

  @override
  ResultFuture<Settings> call() async {
    return _repo.loadSettings();
  }
}
