part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final Brightness brightness;

  const SettingsState({required this.brightness});

  @override
  List<Object> get props => [brightness];
}
