import 'package:anemoi_weather/api/open_meteo/forecast/api_strings.dart';

enum CurrentParameters {
  temperature2M(ApiStrings.temperature2M),
  relativehumidity2M(ApiStrings.relativehumidity2M),
  apparentTemperature(ApiStrings.apparentTemperature),
  isDay(ApiStrings.isDay),
  precipitation(ApiStrings.precipitation),
  rain(ApiStrings.rain),
  showers(ApiStrings.showers),
  snowfall(ApiStrings.snowfall),
  weathercode(ApiStrings.weathercode),
  cloudcover(ApiStrings.cloudcover),
  pressureMsl(ApiStrings.pressureMsl),
  surfacePressure(ApiStrings.surfacePressure),
  windspeed10M(ApiStrings.windspeed10M),
  winddirection10M(ApiStrings.winddirection10M),
  windgusts10M(ApiStrings.windgusts10M);

  const CurrentParameters(this.value);

  factory CurrentParameters.fromString(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => CurrentParameters.values.first,
    );
  }

  final String value;

  @override
  String toString() => value;
}
