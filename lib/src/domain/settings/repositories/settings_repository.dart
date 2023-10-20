import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/settings/entities/settings.dart';

abstract class SettingsRepository {
  ResultFuture<Settings> loadSettings();
  ResultFuture<void> saveSettings(Settings settings);
}
