part of 'settings_cubit.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsStateLoading extends SettingsState {
  const SettingsStateLoading();

  @override
  List<Object?> get props => [];
}

class SettingsStateUpdate extends SettingsState {
  const SettingsStateUpdate({required this.brightness});
  final Brightness brightness;

  @override
  List<Object?> get props => [brightness];
}

class SettingsStateError extends SettingsState {
  const SettingsStateError();

  @override
  List<Object?> get props => [];
}
