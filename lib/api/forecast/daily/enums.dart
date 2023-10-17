import 'package:anemoi_weather/api/forecast/api_strings.dart';

enum DailyParameters {
  temperature2MMax(ApiStrings.temperature2MMax),
  temperature2MMin(ApiStrings.temperature2MMin),
  apparentTemperatureMax(ApiStrings.apparentTemperatureMax),
  apparentTemperatureMin(ApiStrings.apparentTemperatureMin),
  sunrise(ApiStrings.sunrise),
  sunset(ApiStrings.sunset),
  uvIndexMax(ApiStrings.uvIndexMax),
  uvIndexClearSkyMax(ApiStrings.uvIndexClearSkyMax),
  precipitationSum(ApiStrings.precipitationSum),
  rainSum(ApiStrings.rainSum),
  showersSum(ApiStrings.showersSum),
  snowfallSum(ApiStrings.snowfallSum),
  precipitationHours(ApiStrings.precipitationHours),
  precipitationProbabilityMax(ApiStrings.precipitationProbabilityMax),
  windspeed10MMax(ApiStrings.windspeed10MMax),
  windgusts10MMax(ApiStrings.windgusts10MMax),
  winddirection10MDominant(ApiStrings.winddirection10MDominant),
  shortwaveRadiationSum(ApiStrings.shortwaveRadiationSum),
  et0FaoEvapotranspiration(ApiStrings.et0FaoEvapotranspiration);

  const DailyParameters(this.value);

  factory DailyParameters.fromString(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => DailyParameters.values.first,
    );
  }

  final String value;

  @override
  String toString() => value;
}
