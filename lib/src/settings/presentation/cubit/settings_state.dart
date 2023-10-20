part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.brightness});
  final Brightness brightness;

  @override
  List<Object> get props => [brightness];
}
