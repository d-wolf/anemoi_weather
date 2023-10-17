class DailyUnits {
  final String time;
  final String? weathercode;
  final String? temperature2MMax;
  final String? temperature2MMin;
  final String? apparentTemperatureMax;
  final String? apparentTemperatureMin;
  final String? sunrise;
  final String? sunset;
  final String? uvIndexMax;
  final String? uvIndexClearSkyMax;
  final String? precipitationSum;
  final String? rainSum;
  final String? showersSum;
  final String? snowfallSum;
  final String? precipitationHours;
  final String? precipitationProbabilityMax;
  final String? windspeed10MMax;
  final String? windgusts10MMax;
  final String? winddirection10MDominant;
  final String? shortwaveRadiationSum;
  final String? et0FaoEvapotranspiration;

  DailyUnits({
    required this.time,
    this.weathercode,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.apparentTemperatureMin,
    this.sunrise,
    this.sunset,
    this.uvIndexMax,
    this.uvIndexClearSkyMax,
    this.precipitationSum,
    this.rainSum,
    this.showersSum,
    this.snowfallSum,
    this.precipitationHours,
    this.precipitationProbabilityMax,
    this.windspeed10MMax,
    this.windgusts10MMax,
    this.winddirection10MDominant,
    this.shortwaveRadiationSum,
    this.et0FaoEvapotranspiration,
  });
}
