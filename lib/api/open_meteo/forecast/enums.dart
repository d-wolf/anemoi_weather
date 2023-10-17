import 'package:anemoi_weather/api/open_meteo/forecast/api_strings.dart';

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

enum HourlyParameters {
  temperature2M(ApiStrings.temperature2M),
  relativehumidity2M(ApiStrings.relativehumidity2M),
  dewpoint2M(ApiStrings.dewpoint2M),
  apparentTemperature(ApiStrings.apparentTemperature),
  precipitationProbability(ApiStrings.precipitationProbability),
  precipitation(ApiStrings.precipitation),
  rain(ApiStrings.rain),
  showers(ApiStrings.showers),
  snowfall(ApiStrings.snowfall),
  snowDepth(ApiStrings.snowDepth),
  weathercode(ApiStrings.weathercode),
  pressureMsl(ApiStrings.pressureMsl),
  surfacePressure(ApiStrings.surfacePressure),
  cloudcover(ApiStrings.cloudcover),
  cloudcoverLow(ApiStrings.cloudcoverLow),
  cloudcoverMid(ApiStrings.cloudcoverMid),
  cloudcoverHigh(ApiStrings.cloudcoverHigh),
  visibility(ApiStrings.visibility),
  evapotranspiration(ApiStrings.evapotranspiration),
  et0FaoEvapotranspiration(ApiStrings.et0FaoEvapotranspiration),
  vaporPressureDeficit(ApiStrings.vaporPressureDeficit),
  windspeed10M(ApiStrings.windspeed10M),
  windspeed80M(ApiStrings.windspeed80M),
  windspeed120M(ApiStrings.windspeed120M),
  windspeed180M(ApiStrings.windspeed180M),
  winddirection10M(ApiStrings.winddirection10M),
  winddirection80M(ApiStrings.winddirection80M),
  winddirection120M(ApiStrings.winddirection120M),
  winddirection180M(ApiStrings.winddirection180M),
  windgusts10M(ApiStrings.windgusts10M),
  temperature80M(ApiStrings.temperature80M),
  temperature120M(ApiStrings.temperature120M),
  temperature180M(ApiStrings.temperature180M),
  soilTemperature0Cm(ApiStrings.soilTemperature0Cm),
  soilTemperature6Cm(ApiStrings.soilTemperature6Cm),
  soilTemperature18Cm(ApiStrings.soilTemperature18Cm),
  soilTemperature54Cm(ApiStrings.soilTemperature54Cm),
  soilMoisture0To1Cm(ApiStrings.soilMoisture0To1Cm),
  soilMoisture1To3Cm(ApiStrings.soilMoisture1To3Cm),
  soilMoisture3To9Cm(ApiStrings.soilMoisture3To9Cm),
  soilMoisture9To27Cm(ApiStrings.soilMoisture9To27Cm),
  soilMoisture27To81Cm(ApiStrings.soilMoisture27To81Cm);

  const HourlyParameters(this.value);

  factory HourlyParameters.fromString(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => HourlyParameters.values.first,
    );
  }

  final String value;

  @override
  String toString() => value;
}

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
