import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/settings/entities/settings.dart';
import 'package:flutter/foundation.dart';

class SettingsModel extends Settings {
  SettingsModel({
    required super.brightness,
  });

  SettingsModel.empty() : this(brightness: Brightness.dark);

  SettingsModel.fromDomain(Settings settings)
      : this(brightness: settings.brightness);

  factory SettingsModel.fromJson(DataMap json) => SettingsModel(
        brightness: Brightness.values[int.parse(json['brightness'].toString())],
      );

  DataMap toJson() => <String, dynamic>{'brightness': brightness.index};
}
