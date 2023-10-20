class Hourly {
  Hourly({
    required this.time,
    this.temperature2M = const [],
    this.relativehumidity2M = const [],
    this.dewpoint2M = const [],
    this.apparentTemperature = const [],
    this.precipitationProbability = const [],
    this.precipitation = const [],
    this.rain = const [],
    this.showers = const [],
    this.snowfall = const [],
    this.snowDepth = const [],
    this.weathercode = const [],
    this.pressureMsl = const [],
    this.surfacePressure = const [],
    this.cloudcover = const [],
    this.cloudcoverLow = const [],
    this.cloudcoverMid = const [],
    this.cloudcoverHigh = const [],
    this.visibility = const [],
    this.evapotranspiration = const [],
    this.et0FaoEvapotranspiration = const [],
    this.vaporPressureDeficit = const [],
    this.windspeed10M = const [],
    this.windspeed80M = const [],
    this.windspeed120M = const [],
    this.windspeed180M = const [],
    this.winddirection10M = const [],
    this.winddirection80M = const [],
    this.winddirection120M = const [],
    this.winddirection180M = const [],
    this.windgusts10M = const [],
    this.temperature80M = const [],
    this.temperature120M = const [],
    this.temperature180M = const [],
    this.soilTemperature0Cm = const [],
    this.soilTemperature6Cm = const [],
    this.soilTemperature18Cm = const [],
    this.soilTemperature54Cm = const [],
    this.soilMoisture0To1Cm = const [],
    this.soilMoisture1To3Cm = const [],
    this.soilMoisture3To9Cm = const [],
    this.soilMoisture9To27Cm = const [],
    this.soilMoisture27To81Cm = const [],
  });
  final List<DateTime> time;
  final List<double> temperature2M;
  final List<int> relativehumidity2M;
  final List<double> dewpoint2M;
  final List<double> apparentTemperature;
  final List<int> precipitationProbability;
  final List<double> precipitation;
  final List<double> rain;
  final List<double> showers;
  final List<double> snowfall;
  final List<double> snowDepth;
  final List<int> weathercode;
  final List<double> pressureMsl;
  final List<double> surfacePressure;
  final List<int> cloudcover;
  final List<int> cloudcoverLow;
  final List<int> cloudcoverMid;
  final List<int> cloudcoverHigh;
  final List<int> visibility;
  final List<double> evapotranspiration;
  final List<double> et0FaoEvapotranspiration;
  final List<double> vaporPressureDeficit;
  final List<double> windspeed10M;
  final List<double> windspeed80M;
  final List<double> windspeed120M;
  final List<double> windspeed180M;
  final List<int> winddirection10M;
  final List<int> winddirection80M;
  final List<int> winddirection120M;
  final List<int> winddirection180M;
  final List<double> windgusts10M;
  final List<double> temperature80M;
  final List<double> temperature120M;
  final List<double> temperature180M;
  final List<double> soilTemperature0Cm;
  final List<double> soilTemperature6Cm;
  final List<double> soilTemperature18Cm;
  final List<double> soilTemperature54Cm;
  final List<double> soilMoisture0To1Cm;
  final List<double> soilMoisture1To3Cm;
  final List<double> soilMoisture3To9Cm;
  final List<double> soilMoisture9To27Cm;
  final List<double> soilMoisture27To81Cm;
}
