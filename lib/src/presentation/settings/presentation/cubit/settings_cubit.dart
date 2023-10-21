import 'package:anemoi_weather/src/domain/settings/entities/settings.dart';
import 'package:anemoi_weather/src/domain/settings/usecases/load_settings.dart';
import 'package:anemoi_weather/src/domain/settings/usecases/save_settings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required SaveSettings saveSettings,
    required LoadSettings loadSettings,
  })  : _saveSettings = saveSettings,
        _loadSettings = loadSettings,
        super(const SettingsStateLoading());
  final LoadSettings _loadSettings;
  final SaveSettings _saveSettings;

  Future<void> load() async {
    final result = await _loadSettings();
    result.fold(
      (l) => null,
      (r) => emit(SettingsStateUpdate(brightness: r.brightness)),
    );
  }

  Future<void> switchBrightness() async {
    switch (state) {
      case SettingsStateLoading():
        break;
      case final SettingsStateUpdate update:
        final newBrightness = update.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark;

        final result = await _saveSettings(Settings(brightness: newBrightness));

        result.fold(
          (l) => emit(const SettingsStateError()),
          (r) => emit(
            SettingsStateUpdate(brightness: newBrightness),
          ),
        );

      case SettingsStateError():
        break;
    }
  }
}
