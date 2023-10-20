import 'dart:convert';

import 'package:anemoi_weather/src/data/settings/models/settings_model.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/settings/entities/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  Settings loadSettings();
  Future<void> saveSettings(Settings settings);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  SettingsLocalDataSourceImpl(this._prefs);
  static const key = 'settings_key';

  final SharedPreferences _prefs;

  @override
  Settings loadSettings() {
    if (!_prefs.containsKey(key)) {
      return SettingsModel.empty();
    }

    final str = _prefs.getString(key)!;
    final json = jsonDecode(str) as DataMap;
    return SettingsModel.fromJson(json);
  }

  @override
  Future<void> saveSettings(Settings settings) async {
    final model = SettingsModel.fromDomain(settings);
    final encoded = jsonEncode(model.toJson());
    await _prefs.setString(key, encoded);
  }
}
