import 'package:anemoi_weather/src/forecast/data/api_strings.dart';

enum TimeZone {
  auto(ApiStrings.timezoneAuto),
  europeBerlin(ApiStrings.timezoneEuropeBerlin);

  const TimeZone(this.value);

  factory TimeZone.fromString(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => TimeZone.values.first,
    );
  }

  final String value;

  @override
  String toString() => value;
}