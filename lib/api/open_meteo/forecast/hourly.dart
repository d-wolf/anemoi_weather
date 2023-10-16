import 'dart:convert';

class Hourly {
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

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: List<int>.from(json['time'])
          .map(
              (e) => DateTime.fromMillisecondsSinceEpoch(e * 1000, isUtc: true))
          .toList(),
      temperature2M: json.containsKey('temperature_2m')
          ? List<double>.from(json['temperature_2m'])
          : [],
      relativehumidity2M: json.containsKey('relativehumidity_2m')
          ? List<int>.from(json['relativehumidity_2m'])
          : [],
      dewpoint2M: json.containsKey('dewpoint_2m')
          ? List<double>.from(json['dewpoint_2m'])
          : [],
      apparentTemperature: json.containsKey('apparent_temperature')
          ? List<double>.from(json['apparent_temperature'])
          : [],
      precipitationProbability: json.containsKey('precipitation_probability')
          ? List<int>.from(json['precipitation_probability'])
          : [],
      precipitation: json.containsKey('precipitation')
          ? List<double>.from(json['precipitation'])
          : [],
      rain: json.containsKey('rain') ? List<double>.from(json['rain']) : [],
      showers:
          json.containsKey('showers') ? List<double>.from(json['showers']) : [],
      snowfall: json.containsKey('snowfall')
          ? List<double>.from(json['snowfall'])
          : [],
      snowDepth: json.containsKey('snow_depth')
          ? List<double>.from(json['snow_depth'])
          : [],
      weathercode: json.containsKey('weathercode')
          ? List<int>.from(json['weathercode'])
          : [],
      pressureMsl: json.containsKey('pressure_msl')
          ? List<double>.from(json['pressure_msl'])
          : [],
      surfacePressure: json.containsKey('surface_pressure')
          ? List<double>.from(json['surface_pressure'])
          : [],
      cloudcover: json.containsKey('cloudcover')
          ? List<int>.from(json['cloudcover'])
          : [],
      cloudcoverLow: json.containsKey('cloudcover_low')
          ? List<int>.from(json['cloudcover_low'])
          : [],
      cloudcoverMid: json.containsKey('cloudcover_mid')
          ? List<int>.from(json['cloudcover_mid'])
          : [],
      cloudcoverHigh: json.containsKey('cloudcover_high')
          ? List<int>.from(json['cloudcover_high'])
          : [],
      visibility: json.containsKey('visibility')
          ? List<int>.from(json['visibility'])
          : [],
      evapotranspiration: json.containsKey('evapotranspiration')
          ? List<double>.from(json['evapotranspiration'])
          : [],
      et0FaoEvapotranspiration: json.containsKey('et0_fao_evapotranspiration')
          ? List<double>.from(json['et0_fao_evapotranspiration'])
          : [],
      vaporPressureDeficit: json.containsKey('vapor_pressure_deficit')
          ? List<double>.from(json['vapor_pressure_deficit'])
          : [],
      windspeed10M: json.containsKey('windspeed_10m')
          ? List<double>.from(json['windspeed_10m'])
          : [],
      windspeed80M: json.containsKey('windspeed_80m')
          ? List<double>.from(json['windspeed_80m'])
          : [],
      windspeed120M: json.containsKey('windspeed_120m')
          ? List<double>.from(json['windspeed_120m'])
          : [],
      windspeed180M: json.containsKey('windspeed_180m')
          ? List<double>.from(json['windspeed_180m'])
          : [],
      winddirection10M: json.containsKey('winddirection_10m')
          ? List<int>.from(json['winddirection_10m'])
          : [],
      winddirection80M: json.containsKey('winddirection_80m')
          ? List<int>.from(json['winddirection_80m'])
          : [],
      winddirection120M: json.containsKey('winddirection_120m')
          ? List<int>.from(json['winddirection_120m'])
          : [],
      winddirection180M: json.containsKey('winddirection_180m')
          ? List<int>.from(json['winddirection_180m'])
          : [],
      windgusts10M: json.containsKey('windgusts_10m')
          ? List<double>.from(json['windgusts_10m'])
          : [],
      temperature80M: json.containsKey('temperature_80m')
          ? List<double>.from(json['temperature_80m'])
          : [],
      temperature120M: json.containsKey('temperature_120m')
          ? List<double>.from(json['temperature_120m'])
          : [],
      temperature180M: json.containsKey('temperature_180m')
          ? List<double>.from(json['temperature_180m'])
          : [],
      soilTemperature0Cm: json.containsKey('soil_temperature_0cm')
          ? List<double>.from(json['soil_temperature_0cm'])
          : [],
      soilTemperature6Cm: json.containsKey('soil_temperature_6cm')
          ? List<double>.from(json['soil_temperature_6cm'])
          : [],
      soilTemperature18Cm: json.containsKey('soil_temperature_18cm')
          ? List<double>.from(json['soil_temperature_18cm'])
          : [],
      soilTemperature54Cm: json.containsKey('soil_temperature_54cm')
          ? List<double>.from(json['soil_temperature_54cm'])
          : [],
      soilMoisture0To1Cm: json.containsKey('soil_moisture_0_to_1cm')
          ? List<double>.from(json['soil_moisture_0_to_1cm'])
          : [],
      soilMoisture1To3Cm: json.containsKey('soil_moisture_1_to_3cm')
          ? List<double>.from(json['soil_moisture_1_to_3cm'])
          : [],
      soilMoisture3To9Cm: json.containsKey('soil_moisture_3_to_9cm')
          ? List<double>.from(json['soil_moisture_3_to_9cm'])
          : [],
      soilMoisture9To27Cm: json.containsKey('soil_moisture_9_to_27cm')
          ? List<double>.from(json['soil_moisture_9_to_27cm'])
          : [],
      soilMoisture27To81Cm: json.containsKey('soil_moisture_27_to_81cm')
          ? List<double>.from(json['soil_moisture_27_to_81cm'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': jsonEncode(
          time.map((e) => e.millisecondsSinceEpoch ~/ 1000).toList()),
    };

    if (temperature2M.isNotEmpty) {
      map['temperature_2m'] = jsonEncode(temperature2M);
    }

    if (relativehumidity2M.isNotEmpty) {
      map['relativehumidity_2m'] = jsonEncode(relativehumidity2M);
    }

    if (dewpoint2M.isNotEmpty) {
      map['dewpoint_2m'] = jsonEncode(dewpoint2M);
    }

    if (apparentTemperature.isNotEmpty) {
      map['apparent_temperature'] = jsonEncode(apparentTemperature);
    }

    if (precipitationProbability.isNotEmpty) {
      map['precipitation_probability'] = jsonEncode(precipitationProbability);
    }

    if (precipitation.isNotEmpty) {
      map['precipitation'] = jsonEncode(precipitation);
    }

    if (rain.isNotEmpty) {
      map['rain'] = jsonEncode(rain);
    }

    if (showers.isNotEmpty) {
      map['showers'] = jsonEncode(showers);
    }

    if (snowfall.isNotEmpty) {
      map['snowfall'] = jsonEncode(snowfall);
    }

    if (snowDepth.isNotEmpty) {
      map['snow_depth'] = jsonEncode(snowDepth);
    }

    if (weathercode.isNotEmpty) {
      map['weathercode'] = jsonEncode(weathercode);
    }

    if (pressureMsl.isNotEmpty) {
      map['pressure_msl'] = jsonEncode(pressureMsl);
    }

    if (surfacePressure.isNotEmpty) {
      map['surface_pressure'] = jsonEncode(surfacePressure);
    }

    if (cloudcover.isNotEmpty) {
      map['cloudcover'] = jsonEncode(cloudcover);
    }

    if (cloudcoverLow.isNotEmpty) {
      map['cloudcover_low'] = jsonEncode(cloudcoverLow);
    }

    if (cloudcoverMid.isNotEmpty) {
      map['cloudcover_mid'] = jsonEncode(cloudcoverMid);
    }

    if (cloudcoverHigh.isNotEmpty) {
      map['cloudcover_high'] = jsonEncode(cloudcoverHigh);
    }

    if (visibility.isNotEmpty) {
      map['visibility'] = jsonEncode(visibility);
    }

    if (evapotranspiration.isNotEmpty) {
      map['evapotranspiration'] = jsonEncode(evapotranspiration);
    }

    if (et0FaoEvapotranspiration.isNotEmpty) {
      map['et0_fao_evapotranspiration'] = jsonEncode(et0FaoEvapotranspiration);
    }

    if (vaporPressureDeficit.isNotEmpty) {
      map['vapor_pressure_deficit'] = jsonEncode(vaporPressureDeficit);
    }

    if (windspeed10M.isNotEmpty) {
      map['windspeed_10m'] = jsonEncode(windspeed10M);
    }

    if (windspeed80M.isNotEmpty) {
      map['windspeed_80m'] = jsonEncode(windspeed80M);
    }

    if (windspeed120M.isNotEmpty) {
      map['windspeed_120m'] = jsonEncode(windspeed120M);
    }

    if (windspeed180M.isNotEmpty) {
      map['windspeed_180m'] = jsonEncode(windspeed180M);
    }

    if (winddirection10M.isNotEmpty) {
      map['winddirection_10m'] = jsonEncode(winddirection10M);
    }

    if (winddirection80M.isNotEmpty) {
      map['winddirection_80m'] = jsonEncode(winddirection80M);
    }

    if (winddirection120M.isNotEmpty) {
      map['winddirection_120m'] = jsonEncode(winddirection120M);
    }

    if (winddirection180M.isNotEmpty) {
      map['winddirection_180m'] = jsonEncode(winddirection180M);
    }

    if (windgusts10M.isNotEmpty) {
      map['windgusts_10m'] = jsonEncode(windgusts10M);
    }

    if (temperature80M.isNotEmpty) {
      map['temperature_80m'] = jsonEncode(temperature80M);
    }

    if (temperature120M.isNotEmpty) {
      map['temperature_120m'] = jsonEncode(temperature120M);
    }

    if (temperature180M.isNotEmpty) {
      map['temperature_180m'] = jsonEncode(temperature180M);
    }

    if (soilTemperature0Cm.isNotEmpty) {
      map['soil_temperature_0cm'] = jsonEncode(soilTemperature0Cm);
    }

    if (soilTemperature6Cm.isNotEmpty) {
      map['soil_temperature_6cm'] = jsonEncode(soilTemperature6Cm);
    }

    if (soilTemperature18Cm.isNotEmpty) {
      map['soil_temperature_18cm'] = jsonEncode(soilTemperature18Cm);
    }

    if (soilTemperature54Cm.isNotEmpty) {
      map['soil_temperature_54cm'] = jsonEncode(soilTemperature54Cm);
    }

    if (soilMoisture0To1Cm.isNotEmpty) {
      map['soil_moisture_0_to_1cm'] = jsonEncode(soilMoisture0To1Cm);
    }

    if (soilMoisture1To3Cm.isNotEmpty) {
      map['soil_moisture_1_to_3cm'] = jsonEncode(soilMoisture1To3Cm);
    }

    if (soilMoisture3To9Cm.isNotEmpty) {
      map['soil_moisture_3_to_9cm'] = jsonEncode(soilMoisture3To9Cm);
    }

    if (soilMoisture9To27Cm.isNotEmpty) {
      map['soil_moisture_9_to_27cm'] = jsonEncode(soilMoisture9To27Cm);
    }

    if (soilMoisture27To81Cm.isNotEmpty) {
      map['soil_moisture_27_to_81cm'] = jsonEncode(soilMoisture27To81Cm);
    }

    return map;
  }
}

class HourlyUnits {
  final String time;
  final String? temperature2M;
  final String? relativehumidity2M;
  final String? dewpoint2M;
  final String? apparentTemperature;
  final String? precipitationProbability;
  final String? precipitation;
  final String? rain;
  final String? showers;
  final String? snowfall;
  final String? snowDepth;
  final String? weathercode;
  final String? pressureMsl;
  final String? surfacePressure;
  final String? cloudcover;
  final String? cloudcoverLow;
  final String? cloudcoverMid;
  final String? cloudcoverHigh;
  final String? visibility;
  final String? evapotranspiration;
  final String? et0FaoEvapotranspiration;
  final String? vaporPressureDeficit;
  final String? windspeed10M;
  final String? windspeed80M;
  final String? windspeed120M;
  final String? windspeed180M;
  final String? winddirection10M;
  final String? winddirection80M;
  final String? winddirection120M;
  final String? winddirection180M;
  final String? windgusts10M;
  final String? temperature80M;
  final String? temperature120M;
  final String? temperature180M;
  final String? soilTemperature0Cm;
  final String? soilTemperature6Cm;
  final String? soilTemperature18Cm;
  final String? soilTemperature54Cm;
  final String? soilMoisture0To1Cm;
  final String? soilMoisture1To3Cm;
  final String? soilMoisture3To9Cm;
  final String? soilMoisture9To27Cm;
  final String? soilMoisture27To81Cm;

  HourlyUnits({
    required this.time,
    this.temperature2M,
    this.relativehumidity2M,
    this.dewpoint2M,
    this.apparentTemperature,
    this.precipitationProbability,
    this.precipitation,
    this.rain,
    this.showers,
    this.snowfall,
    this.snowDepth,
    this.weathercode,
    this.pressureMsl,
    this.surfacePressure,
    this.cloudcover,
    this.cloudcoverLow,
    this.cloudcoverMid,
    this.cloudcoverHigh,
    this.visibility,
    this.evapotranspiration,
    this.et0FaoEvapotranspiration,
    this.vaporPressureDeficit,
    this.windspeed10M,
    this.windspeed80M,
    this.windspeed120M,
    this.windspeed180M,
    this.winddirection10M,
    this.winddirection80M,
    this.winddirection120M,
    this.winddirection180M,
    this.windgusts10M,
    this.temperature80M,
    this.temperature120M,
    this.temperature180M,
    this.soilTemperature0Cm,
    this.soilTemperature6Cm,
    this.soilTemperature18Cm,
    this.soilTemperature54Cm,
    this.soilMoisture0To1Cm,
    this.soilMoisture1To3Cm,
    this.soilMoisture3To9Cm,
    this.soilMoisture9To27Cm,
    this.soilMoisture27To81Cm,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json['time'] as String,
      temperature2M: json.containsKey('temperature_2m')
          ? json['temperature_2m'] as String
          : null,
      relativehumidity2M: json.containsKey('relativehumidity_2m')
          ? json['relativehumidity_2m'] as String
          : null,
      dewpoint2M: json.containsKey('dewpoint_2m')
          ? json['dewpoint_2m'] as String
          : null,
      apparentTemperature: json.containsKey('apparent_temperature')
          ? json['apparent_temperature'] as String
          : null,
      precipitationProbability: json.containsKey('precipitation_probability')
          ? json['precipitation_probability'] as String
          : null,
      precipitation: json.containsKey('precipitation')
          ? json['precipitation'] as String
          : null,
      rain: json.containsKey('rain') ? json['rain'] as String : null,
      showers: json.containsKey('showers') ? json['showers'] as String : null,
      snowfall:
          json.containsKey('snowfall') ? json['snowfall'] as String : null,
      snowDepth:
          json.containsKey('snow_depth') ? json['snow_depth'] as String : null,
      weathercode: json.containsKey('weathercode')
          ? json['weathercode'] as String
          : null,
      pressureMsl: json.containsKey('pressure_msl')
          ? json['pressure_msl'] as String
          : null,
      surfacePressure: json.containsKey('surface_pressure')
          ? json['surface_pressure'] as String
          : null,
      cloudcover:
          json.containsKey('cloudcover') ? json['cloudcover'] as String : null,
      cloudcoverLow: json.containsKey('cloudcover_low')
          ? json['cloudcover_low'] as String
          : null,
      cloudcoverMid: json.containsKey('cloudcover_mid')
          ? json['cloudcover_mid'] as String
          : null,
      cloudcoverHigh: json.containsKey('cloudcover_high')
          ? json['cloudcover_high'] as String
          : null,
      visibility:
          json.containsKey('visibility') ? json['visibility'] as String : null,
      evapotranspiration: json.containsKey('evapotranspiration')
          ? json['evapotranspiration'] as String
          : null,
      et0FaoEvapotranspiration: json.containsKey('et0_fao_evapotranspiration')
          ? json['et0_fao_evapotranspiration'] as String
          : null,
      vaporPressureDeficit: json.containsKey('vapor_pressure_deficit')
          ? json['vapor_pressure_deficit'] as String
          : null,
      windspeed10M: json.containsKey('windspeed_10m')
          ? json['windspeed_10m'] as String
          : null,
      windspeed80M: json.containsKey('windspeed_80m')
          ? json['windspeed_80m'] as String
          : null,
      windspeed120M: json.containsKey('windspeed_120m')
          ? json['windspeed_120m'] as String
          : null,
      windspeed180M: json.containsKey('windspeed_180m')
          ? json['windspeed_180m'] as String
          : null,
      winddirection10M: json.containsKey('winddirection_10m')
          ? json['winddirection_10m'] as String
          : null,
      winddirection80M: json.containsKey('winddirection_80m')
          ? json['winddirection_80m'] as String
          : null,
      winddirection120M: json.containsKey('winddirection_120m')
          ? json['winddirection_120m'] as String
          : null,
      winddirection180M: json.containsKey('winddirection_180m')
          ? json['winddirection_180m'] as String
          : null,
      windgusts10M: json.containsKey('windgusts_10m')
          ? json['windgusts_10m'] as String
          : null,
      temperature80M: json.containsKey('temperature_80m')
          ? json['temperature_80m'] as String
          : null,
      temperature120M: json.containsKey('temperature_120m')
          ? json['temperature_120m'] as String
          : null,
      temperature180M: json.containsKey('temperature_180m')
          ? json['temperature_180m'] as String
          : null,
      soilTemperature0Cm: json.containsKey('soil_temperature_0cm')
          ? json['soil_temperature_0cm'] as String
          : null,
      soilTemperature6Cm: json.containsKey('soil_temperature_6cm')
          ? json['soil_temperature_6cm'] as String
          : null,
      soilTemperature18Cm: json.containsKey('soil_temperature_18cm')
          ? json['soil_temperature_18cm'] as String
          : null,
      soilTemperature54Cm: json.containsKey('soil_temperature_54cm')
          ? json['soil_temperature_54cm'] as String
          : null,
      soilMoisture0To1Cm: json.containsKey('soil_moisture_0_to_1cm')
          ? json['soil_moisture_0_to_1cm'] as String
          : null,
      soilMoisture1To3Cm: json.containsKey('soil_moisture_1_to_3cm')
          ? json['soil_moisture_1_to_3cm'] as String
          : null,
      soilMoisture3To9Cm: json.containsKey('soil_moisture_3_to_9cm')
          ? json['soil_moisture_3_to_9cm'] as String
          : null,
      soilMoisture9To27Cm: json.containsKey('soil_moisture_9_to_27cm')
          ? json['soil_moisture_9_to_27cm'] as String
          : null,
      soilMoisture27To81Cm: json.containsKey('soil_moisture_27_to_81cm')
          ? json['soil_moisture_27_to_81cm'] as String
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time,
    };

    if (temperature2M != null) {
      map['temperature_2m'] = temperature2M;
    }

    if (relativehumidity2M != null) {
      map['relativehumidity_2m'] = relativehumidity2M;
    }

    if (dewpoint2M != null) {
      map['dewpoint_2m'] = dewpoint2M;
    }

    if (apparentTemperature != null) {
      map['apparent_temperature'] = apparentTemperature;
    }

    if (precipitationProbability != null) {
      map['precipitation_probability'] = precipitationProbability;
    }

    if (precipitation != null) {
      map['precipitation'] = precipitation;
    }

    if (rain != null) {
      map['rain'] = rain;
    }

    if (showers != null) {
      map['showers'] = showers;
    }

    if (snowfall != null) {
      map['snowfall'] = snowfall;
    }

    if (snowDepth != null) {
      map['snow_depth'] = snowDepth;
    }

    if (weathercode != null) {
      map['weathercode'] = weathercode;
    }

    if (pressureMsl != null) {
      map['pressure_msl'] = pressureMsl;
    }

    if (surfacePressure != null) {
      map['surface_pressure'] = surfacePressure;
    }

    if (cloudcover != null) {
      map['cloudcover'] = cloudcover;
    }

    if (cloudcoverLow != null) {
      map['cloudcover_low'] = cloudcoverLow;
    }

    if (cloudcoverMid != null) {
      map['cloudcover_mid'] = cloudcoverMid;
    }

    if (cloudcoverHigh != null) {
      map['cloudcover_high'] = cloudcoverHigh;
    }

    if (visibility != null) {
      map['visibility'] = visibility;
    }

    if (evapotranspiration != null) {
      map['evapotranspiration'] = evapotranspiration;
    }

    if (et0FaoEvapotranspiration != null) {
      map['et0_fao_evapotranspiration'] = et0FaoEvapotranspiration;
    }

    if (vaporPressureDeficit != null) {
      map['vapor_pressure_deficit'] = vaporPressureDeficit;
    }

    if (windspeed10M != null) {
      map['windspeed_10m'] = windspeed10M;
    }

    if (windspeed80M != null) {
      map['windspeed_80m'] = windspeed80M;
    }

    if (windspeed120M != null) {
      map['windspeed_120m'] = windspeed120M;
    }

    if (windspeed180M != null) {
      map['windspeed_180m'] = windspeed180M;
    }

    if (winddirection10M != null) {
      map['winddirection_10m'] = winddirection10M;
    }

    if (winddirection80M != null) {
      map['winddirection_80m'] = winddirection80M;
    }

    if (winddirection120M != null) {
      map['winddirection_120m'] = winddirection120M;
    }

    if (winddirection180M != null) {
      map['winddirection_180m'] = winddirection180M;
    }

    if (windgusts10M != null) {
      map['windgusts_10m'] = windgusts10M;
    }

    if (temperature80M != null) {
      map['temperature_80m'] = temperature80M;
    }

    if (temperature120M != null) {
      map['temperature_120m'] = temperature120M;
    }

    if (temperature180M != null) {
      map['temperature_180m'] = temperature180M;
    }

    if (soilTemperature0Cm != null) {
      map['soil_temperature_0cm'] = soilTemperature0Cm;
    }

    if (soilTemperature6Cm != null) {
      map['soil_temperature_6cm'] = soilTemperature6Cm;
    }

    if (soilTemperature18Cm != null) {
      map['soil_temperature_18cm'] = soilTemperature18Cm;
    }

    if (soilTemperature54Cm != null) {
      map['soil_temperature_54cm'] = soilTemperature54Cm;
    }

    if (soilMoisture0To1Cm != null) {
      map['soil_moisture_0_to_1cm'] = soilMoisture0To1Cm;
    }

    if (soilMoisture1To3Cm != null) {
      map['soil_moisture_1_to_3cm'] = soilMoisture1To3Cm;
    }

    if (soilMoisture3To9Cm != null) {
      map['soil_moisture_3_to_9cm'] = soilMoisture3To9Cm;
    }

    if (soilMoisture9To27Cm != null) {
      map['soil_moisture_9_to_27cm'] = soilMoisture9To27Cm;
    }

    if (soilMoisture27To81Cm != null) {
      map['soil_moisture_27_to_81cm'] = soilMoisture27To81Cm;
    }

    return map;
  }
}
