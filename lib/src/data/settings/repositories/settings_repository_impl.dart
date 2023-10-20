import 'package:anemoi_weather/src/data/settings/datasources/settings_local_data_source.dart';
import 'package:anemoi_weather/src/domain/core/errors/failure.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/settings/entities/settings.dart';
import 'package:anemoi_weather/src/domain/settings/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._localDataSource);
  final SettingsLocalDataSource _localDataSource;

  @override
  ResultFuture<Settings> loadSettings() {
    try {
      final result = _localDataSource.loadSettings();
      return Future.value(right(result));
    } catch (e) {
      return Future.value(left(StorageFailure(message: e.toString())));
    }
  }

  @override
  ResultFuture<void> saveSettings(Settings settings) async {
    try {
      await _localDataSource.saveSettings(settings);
      return right(null);
    } catch (e) {
      return left(StorageFailure(message: e.toString()));
    }
  }
}
