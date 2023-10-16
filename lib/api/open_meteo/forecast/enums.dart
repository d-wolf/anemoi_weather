enum TimeZone {
  auto('auto'),
  europeBerlin('Europe/Berlin');

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
  temperature2M('temperature_2m'),
  relativehumidity2M('relativehumidity_2m'),
  apparentTemperature('apparent_temperature'),
  isDay('is_day'),
  precipitation('precipitation'),
  rain('rain'),
  showers('showers'),
  snowfall('snowfall'),
  weathercode('weathercode'),
  cloudcover('cloudcover'),
  pressureMsl('pressure_msl'),
  surfacePressure('surface_pressure'),
  windspeed10M('windspeed_10m'),
  winddirection10M('winddirection_10m'),
  windgusts10M('windgusts_10m');

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

enum HourlyQueryParameters {
  temperature2M('temperature_2m'),
  relativehumidity2M('relativehumidity_2m'),
  dewpoint2M('dewpoint_2m'),
  apparentTemperature('apparent_temperature'),
  precipitationProbability('precipitation_probability'),
  precipitation('precipitation'),
  rain('rain'),
  showers('showers'),
  snowfall('snowfall'),
  snowDepth('snow_depth'),
  weathercode('weathercode'),
  pressureMsl('pressure_msl'),
  surfacePressure('surface_pressure'),
  cloudcover('cloudcover'),
  cloudcoverLow('cloudcover_low'),
  cloudcoverMid('cloudcover_mid'),
  cloudcoverHigh('cloudcover_high'),
  visibility('visibility'),
  evapotranspiration('evapotranspiration'),
  et0FaoEvapotranspiration('et0_fao_evapotranspiration'),
  vaporPressureDeficit('vapor_pressure_deficit'),
  windspeed10M('windspeed_10m'),
  windspeed80M('windspeed_80m'),
  windspeed120M('windspeed_120m'),
  windspeed180M('windspeed_180m'),
  winddirection10M('winddirection_10m'),
  winddirection80M('winddirection_80m'),
  winddirection120M('winddirection_120m'),
  winddirection180M('winddirection_180m'),
  windgusts10M('windgusts_10m'),
  temperature80M('temperature_80m'),
  temperature120M('temperature_120m'),
  temperature180M('temperature_180m'),
  soilTemperature0Cm('soil_temperature_0cm'),
  soilTemperature6Cm('soil_temperature_6cm'),
  soilTemperature18Cm('soil_temperature_18cm'),
  soilTemperature54Cm('soil_temperature_54cm'),
  soilMoisture0To1Cm('soil_moisture_0_to_1cm'),
  soilMoisture1To3Cm('soil_moisture_1_to_3cm'),
  soilMoisture3To9Cm('soil_moisture_3_to_9cm'),
  soilMoisture9To27Cm('soil_moisture_9_to_27cm'),
  soilMoisture27To81Cm('soil_moisture_27_to_81cm');

  const HourlyQueryParameters(this.value);

  factory HourlyQueryParameters.fromString(String value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => HourlyQueryParameters.values.first,
    );
  }

  final String value;

  @override
  String toString() => value;
}

enum DailyParameters {
  temperature2MMax('temperature_2m_max'),
  temperature2MMin('temperature_2m_min'),
  apparentTemperatureMax('apparent_temperature_max'),
  apparentTemperatureMin('apparent_temperature_min'),
  sunrise('sunrise'),
  sunset('sunset'),
  uvIndexMax('uv_index_max'),
  uvIndexClearSkyMax('uv_index_clear_sky_max'),
  precipitationSum('precipitation_sum'),
  rainSum('rain_sum'),
  showersSum('showers_sum'),
  snowfallSum('snowfall_sum'),
  precipitationHours('precipitation_hours'),
  precipitationProbabilityMax('precipitation_probability_max'),
  windspeed10MMax('windspeed_10m_max'),
  windgusts10MMax('windgusts_10m_max'),
  winddirection10MDominant('winddirection_10m_dominant'),
  shortwaveRadiationSum('shortwave_radiation_sum'),
  et0FaoEvapotranspiration('et0_fao_evapotranspiration');

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
