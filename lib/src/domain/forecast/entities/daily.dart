class Daily {
  Daily({
    required this.time,
    this.weathercode = const [],
    this.temperature2MMax = const [],
    this.temperature2MMin = const [],
    this.apparentTemperatureMax = const [],
    this.apparentTemperatureMin = const [],
    this.sunrise = const [],
    this.sunset = const [],
    this.uvIndexMax = const [],
    this.uvIndexClearSkyMax = const [],
    this.precipitationSum = const [],
    this.rainSum = const [],
    this.showersSum = const [],
    this.snowfallSum = const [],
    this.precipitationHours = const [],
    this.precipitationProbabilityMax = const [],
    this.windspeed10MMax = const [],
    this.windgusts10MMax = const [],
    this.winddirection10MDominant = const [],
    this.shortwaveRadiationSum = const [],
    this.et0FaoEvapotranspiration = const [],
  });
  final List<DateTime> time;
  final List<int> weathercode;
  final List<double> temperature2MMax;
  final List<double> temperature2MMin;
  final List<double> apparentTemperatureMax;
  final List<double> apparentTemperatureMin;
  final List<String> sunrise;
  final List<String> sunset;
  final List<double> uvIndexMax;
  final List<double> uvIndexClearSkyMax;
  final List<double> precipitationSum;
  final List<double> rainSum;
  final List<int> showersSum;
  final List<double> snowfallSum;
  final List<int> precipitationHours;
  final List<int> precipitationProbabilityMax;
  final List<double> windspeed10MMax;
  final List<double> windgusts10MMax;
  final List<int> winddirection10MDominant;
  final List<double> shortwaveRadiationSum;
  final List<double> et0FaoEvapotranspiration;
}
