import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(brightness: Brightness.dark));

  Future<void> init() async {}
  Future<void> switchBrightness() async {
    emit(SettingsState(
        brightness: state.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark));
  }
}
