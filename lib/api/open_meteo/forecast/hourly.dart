import 'dart:convert';

import 'package:anemoi_weather/api/open_meteo/forecast/enums.dart';

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
      temperature2M: json.containsKey(HourlyParameters.temperature2M.value)
          ? List<double>.from(json[HourlyParameters.temperature2M.value])
          : [],
      relativehumidity2M:
          json.containsKey(HourlyParameters.relativehumidity2M.value)
              ? List<int>.from(json[HourlyParameters.relativehumidity2M.value])
              : [],
      dewpoint2M: json.containsKey(HourlyParameters.dewpoint2M.value)
          ? List<double>.from(json[HourlyParameters.dewpoint2M.value])
          : [],
      apparentTemperature: json
              .containsKey(HourlyParameters.apparentTemperature.value)
          ? List<double>.from(json[HourlyParameters.apparentTemperature.value])
          : [],
      precipitationProbability:
          json.containsKey(HourlyParameters.precipitationProbability.value)
              ? List<int>.from(
                  json[HourlyParameters.precipitationProbability.value])
              : [],
      precipitation: json.containsKey(HourlyParameters.precipitation.value)
          ? List<double>.from(json[HourlyParameters.precipitation.value])
          : [],
      rain: json.containsKey(HourlyParameters.rain.value)
          ? List<double>.from(json[HourlyParameters.rain.value])
          : [],
      showers: json.containsKey(HourlyParameters.showers.value)
          ? List<double>.from(json[HourlyParameters.showers.value])
          : [],
      snowfall: json.containsKey(HourlyParameters.snowfall.value)
          ? List<double>.from(json[HourlyParameters.snowfall.value])
          : [],
      snowDepth: json.containsKey(HourlyParameters.snowDepth.value)
          ? List<double>.from(json[HourlyParameters.snowDepth.value])
          : [],
      weathercode: json.containsKey(HourlyParameters.weathercode.value)
          ? List<int>.from(json[HourlyParameters.weathercode.value])
          : [],
      pressureMsl: json.containsKey(HourlyParameters.pressureMsl.value)
          ? List<double>.from(json[HourlyParameters.pressureMsl.value])
          : [],
      surfacePressure: json.containsKey(HourlyParameters.surfacePressure.value)
          ? List<double>.from(json[HourlyParameters.surfacePressure.value])
          : [],
      cloudcover: json.containsKey(HourlyParameters.cloudcover.value)
          ? List<int>.from(json[HourlyParameters.cloudcover.value])
          : [],
      cloudcoverLow: json.containsKey(HourlyParameters.cloudcoverLow.value)
          ? List<int>.from(json[HourlyParameters.cloudcoverLow.value])
          : [],
      cloudcoverMid: json.containsKey(HourlyParameters.cloudcoverMid.value)
          ? List<int>.from(json[HourlyParameters.cloudcoverMid.value])
          : [],
      cloudcoverHigh: json.containsKey(HourlyParameters.cloudcoverHigh.value)
          ? List<int>.from(json[HourlyParameters.cloudcoverHigh.value])
          : [],
      visibility: json.containsKey(HourlyParameters.visibility.value)
          ? List<int>.from(json[HourlyParameters.visibility.value])
          : [],
      evapotranspiration: json
              .containsKey(HourlyParameters.evapotranspiration.value)
          ? List<double>.from(json[HourlyParameters.evapotranspiration.value])
          : [],
      et0FaoEvapotranspiration:
          json.containsKey(HourlyParameters.et0FaoEvapotranspiration.value)
              ? List<double>.from(
                  json[HourlyParameters.et0FaoEvapotranspiration.value])
              : [],
      vaporPressureDeficit: json
              .containsKey(HourlyParameters.vaporPressureDeficit.value)
          ? List<double>.from(json[HourlyParameters.vaporPressureDeficit.value])
          : [],
      windspeed10M: json.containsKey(HourlyParameters.windspeed10M.value)
          ? List<double>.from(json[HourlyParameters.windspeed10M.value])
          : [],
      windspeed80M: json.containsKey(HourlyParameters.windspeed80M.value)
          ? List<double>.from(json[HourlyParameters.windspeed80M.value])
          : [],
      windspeed120M: json.containsKey(HourlyParameters.windspeed120M.value)
          ? List<double>.from(json[HourlyParameters.windspeed120M.value])
          : [],
      windspeed180M: json.containsKey(HourlyParameters.windspeed180M.value)
          ? List<double>.from(json[HourlyParameters.windspeed180M.value])
          : [],
      winddirection10M:
          json.containsKey(HourlyParameters.winddirection10M.value)
              ? List<int>.from(json[HourlyParameters.winddirection10M.value])
              : [],
      winddirection80M:
          json.containsKey(HourlyParameters.winddirection80M.value)
              ? List<int>.from(json[HourlyParameters.winddirection80M.value])
              : [],
      winddirection120M:
          json.containsKey(HourlyParameters.winddirection120M.value)
              ? List<int>.from(json[HourlyParameters.winddirection120M.value])
              : [],
      winddirection180M:
          json.containsKey(HourlyParameters.winddirection180M.value)
              ? List<int>.from(json[HourlyParameters.winddirection180M.value])
              : [],
      windgusts10M: json.containsKey(HourlyParameters.windgusts10M.value)
          ? List<double>.from(json[HourlyParameters.windgusts10M.value])
          : [],
      temperature80M: json.containsKey(HourlyParameters.temperature80M.value)
          ? List<double>.from(json[HourlyParameters.temperature80M.value])
          : [],
      temperature120M: json.containsKey(HourlyParameters.temperature120M.value)
          ? List<double>.from(json[HourlyParameters.temperature120M.value])
          : [],
      temperature180M: json.containsKey(HourlyParameters.temperature180M.value)
          ? List<double>.from(json[HourlyParameters.temperature180M.value])
          : [],
      soilTemperature0Cm: json
              .containsKey(HourlyParameters.soilTemperature0Cm.value)
          ? List<double>.from(json[HourlyParameters.soilTemperature0Cm.value])
          : [],
      soilTemperature6Cm: json
              .containsKey(HourlyParameters.soilTemperature6Cm.value)
          ? List<double>.from(json[HourlyParameters.soilTemperature6Cm.value])
          : [],
      soilTemperature18Cm: json
              .containsKey(HourlyParameters.soilTemperature18Cm.value)
          ? List<double>.from(json[HourlyParameters.soilTemperature18Cm.value])
          : [],
      soilTemperature54Cm: json
              .containsKey(HourlyParameters.soilTemperature54Cm.value)
          ? List<double>.from(json[HourlyParameters.soilTemperature54Cm.value])
          : [],
      soilMoisture0To1Cm: json
              .containsKey(HourlyParameters.soilMoisture0To1Cm.value)
          ? List<double>.from(json[HourlyParameters.soilMoisture0To1Cm.value])
          : [],
      soilMoisture1To3Cm: json
              .containsKey(HourlyParameters.soilMoisture1To3Cm.value)
          ? List<double>.from(json[HourlyParameters.soilMoisture1To3Cm.value])
          : [],
      soilMoisture3To9Cm: json
              .containsKey(HourlyParameters.soilMoisture3To9Cm.value)
          ? List<double>.from(json[HourlyParameters.soilMoisture3To9Cm.value])
          : [],
      soilMoisture9To27Cm: json
              .containsKey(HourlyParameters.soilMoisture9To27Cm.value)
          ? List<double>.from(json[HourlyParameters.soilMoisture9To27Cm.value])
          : [],
      soilMoisture27To81Cm: json
              .containsKey(HourlyParameters.soilMoisture27To81Cm.value)
          ? List<double>.from(json[HourlyParameters.soilMoisture27To81Cm.value])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': jsonEncode(
          time.map((e) => e.millisecondsSinceEpoch ~/ 1000).toList()),
    };

    if (temperature2M.isNotEmpty) {
      map[HourlyParameters.temperature2M.value] = jsonEncode(temperature2M);
    }

    if (relativehumidity2M.isNotEmpty) {
      map[HourlyParameters.relativehumidity2M.value] =
          jsonEncode(relativehumidity2M);
    }

    if (dewpoint2M.isNotEmpty) {
      map[HourlyParameters.dewpoint2M.value] = jsonEncode(dewpoint2M);
    }

    if (apparentTemperature.isNotEmpty) {
      map[HourlyParameters.apparentTemperature.value] =
          jsonEncode(apparentTemperature);
    }

    if (precipitationProbability.isNotEmpty) {
      map[HourlyParameters.precipitationProbability.value] =
          jsonEncode(precipitationProbability);
    }

    if (precipitation.isNotEmpty) {
      map[HourlyParameters.precipitation.value] = jsonEncode(precipitation);
    }

    if (rain.isNotEmpty) {
      map[HourlyParameters.rain.value] = jsonEncode(rain);
    }

    if (showers.isNotEmpty) {
      map[HourlyParameters.showers.value] = jsonEncode(showers);
    }

    if (snowfall.isNotEmpty) {
      map[HourlyParameters.snowfall.value] = jsonEncode(snowfall);
    }

    if (snowDepth.isNotEmpty) {
      map[HourlyParameters.snowDepth.value] = jsonEncode(snowDepth);
    }

    if (weathercode.isNotEmpty) {
      map[HourlyParameters.weathercode.value] = jsonEncode(weathercode);
    }

    if (pressureMsl.isNotEmpty) {
      map[HourlyParameters.pressureMsl.value] = jsonEncode(pressureMsl);
    }

    if (surfacePressure.isNotEmpty) {
      map[HourlyParameters.surfacePressure.value] = jsonEncode(surfacePressure);
    }

    if (cloudcover.isNotEmpty) {
      map[HourlyParameters.cloudcover.value] = jsonEncode(cloudcover);
    }

    if (cloudcoverLow.isNotEmpty) {
      map[HourlyParameters.cloudcoverLow.value] = jsonEncode(cloudcoverLow);
    }

    if (cloudcoverMid.isNotEmpty) {
      map[HourlyParameters.cloudcoverMid.value] = jsonEncode(cloudcoverMid);
    }

    if (cloudcoverHigh.isNotEmpty) {
      map[HourlyParameters.cloudcoverHigh.value] = jsonEncode(cloudcoverHigh);
    }

    if (visibility.isNotEmpty) {
      map[HourlyParameters.visibility.value] = jsonEncode(visibility);
    }

    if (evapotranspiration.isNotEmpty) {
      map[HourlyParameters.evapotranspiration.value] =
          jsonEncode(evapotranspiration);
    }

    if (et0FaoEvapotranspiration.isNotEmpty) {
      map[HourlyParameters.et0FaoEvapotranspiration.value] =
          jsonEncode(et0FaoEvapotranspiration);
    }

    if (vaporPressureDeficit.isNotEmpty) {
      map[HourlyParameters.vaporPressureDeficit.value] =
          jsonEncode(vaporPressureDeficit);
    }

    if (windspeed10M.isNotEmpty) {
      map[HourlyParameters.windspeed10M.value] = jsonEncode(windspeed10M);
    }

    if (windspeed80M.isNotEmpty) {
      map[HourlyParameters.windspeed80M.value] = jsonEncode(windspeed80M);
    }

    if (windspeed120M.isNotEmpty) {
      map[HourlyParameters.winddirection120M.value] = jsonEncode(windspeed120M);
    }

    if (windspeed180M.isNotEmpty) {
      map[HourlyParameters.winddirection180M.value] = jsonEncode(windspeed180M);
    }

    if (winddirection10M.isNotEmpty) {
      map[HourlyParameters.winddirection10M.value] =
          jsonEncode(winddirection10M);
    }

    if (winddirection80M.isNotEmpty) {
      map[HourlyParameters.winddirection80M.value] =
          jsonEncode(winddirection80M);
    }

    if (winddirection120M.isNotEmpty) {
      map[HourlyParameters.winddirection120M.value] =
          jsonEncode(winddirection120M);
    }

    if (winddirection180M.isNotEmpty) {
      map[HourlyParameters.winddirection180M.value] =
          jsonEncode(winddirection180M);
    }

    if (windgusts10M.isNotEmpty) {
      map[HourlyParameters.windgusts10M.value] = jsonEncode(windgusts10M);
    }

    if (temperature80M.isNotEmpty) {
      map[HourlyParameters.temperature80M.value] = jsonEncode(temperature80M);
    }

    if (temperature120M.isNotEmpty) {
      map[HourlyParameters.temperature120M.value] = jsonEncode(temperature120M);
    }

    if (temperature180M.isNotEmpty) {
      map[HourlyParameters.temperature180M.value] = jsonEncode(temperature180M);
    }

    if (soilTemperature0Cm.isNotEmpty) {
      map[HourlyParameters.soilTemperature0Cm.value] =
          jsonEncode(soilTemperature0Cm);
    }

    if (soilTemperature6Cm.isNotEmpty) {
      map[HourlyParameters.soilTemperature6Cm.value] =
          jsonEncode(soilTemperature6Cm);
    }

    if (soilTemperature18Cm.isNotEmpty) {
      map[HourlyParameters.soilTemperature18Cm.value] =
          jsonEncode(soilTemperature18Cm);
    }

    if (soilTemperature54Cm.isNotEmpty) {
      map[HourlyParameters.soilTemperature54Cm.value] =
          jsonEncode(soilTemperature54Cm);
    }

    if (soilMoisture0To1Cm.isNotEmpty) {
      map[HourlyParameters.soilMoisture0To1Cm.value] =
          jsonEncode(soilMoisture0To1Cm);
    }

    if (soilMoisture1To3Cm.isNotEmpty) {
      map[HourlyParameters.soilMoisture1To3Cm.value] =
          jsonEncode(soilMoisture1To3Cm);
    }

    if (soilMoisture3To9Cm.isNotEmpty) {
      map[HourlyParameters.soilMoisture3To9Cm.value] =
          jsonEncode(soilMoisture3To9Cm);
    }

    if (soilMoisture9To27Cm.isNotEmpty) {
      map[HourlyParameters.soilMoisture9To27Cm.value] =
          jsonEncode(soilMoisture9To27Cm);
    }

    if (soilMoisture27To81Cm.isNotEmpty) {
      map[HourlyParameters.soilMoisture27To81Cm.value] =
          jsonEncode(soilMoisture27To81Cm);
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
      temperature2M: json.containsKey(HourlyParameters.temperature2M.value)
          ? json[HourlyParameters.temperature2M.value] as String
          : null,
      relativehumidity2M:
          json.containsKey(HourlyParameters.relativehumidity2M.value)
              ? json[HourlyParameters.relativehumidity2M.value] as String
              : null,
      dewpoint2M: json.containsKey(HourlyParameters.dewpoint2M.value)
          ? json[HourlyParameters.dewpoint2M.value] as String
          : null,
      apparentTemperature:
          json.containsKey(HourlyParameters.apparentTemperature.value)
              ? json[HourlyParameters.apparentTemperature.value] as String
              : null,
      precipitationProbability:
          json.containsKey(HourlyParameters.precipitationProbability.value)
              ? json[HourlyParameters.precipitationProbability.value] as String
              : null,
      precipitation: json.containsKey(HourlyParameters.precipitation.value)
          ? json[HourlyParameters.precipitation.value] as String
          : null,
      rain: json.containsKey(HourlyParameters.rain.value)
          ? json[HourlyParameters.rain.value] as String
          : null,
      showers: json.containsKey(HourlyParameters.showers.value)
          ? json[HourlyParameters.showers.value] as String
          : null,
      snowfall: json.containsKey(HourlyParameters.snowfall.value)
          ? json[HourlyParameters.snowfall.value] as String
          : null,
      snowDepth: json.containsKey(HourlyParameters.snowDepth.value)
          ? json[HourlyParameters.snowDepth.value] as String
          : null,
      weathercode: json.containsKey(HourlyParameters.weathercode.value)
          ? json[HourlyParameters.weathercode.value] as String
          : null,
      pressureMsl: json.containsKey(HourlyParameters.pressureMsl.value)
          ? json[HourlyParameters.pressureMsl.value] as String
          : null,
      surfacePressure: json.containsKey(HourlyParameters.surfacePressure.value)
          ? json[HourlyParameters.surfacePressure.value] as String
          : null,
      cloudcover: json.containsKey(HourlyParameters.cloudcover.value)
          ? json[HourlyParameters.cloudcover.value] as String
          : null,
      cloudcoverLow: json.containsKey(HourlyParameters.cloudcoverLow.value)
          ? json[HourlyParameters.cloudcoverLow.value] as String
          : null,
      cloudcoverMid: json.containsKey(HourlyParameters.cloudcoverMid.value)
          ? json[HourlyParameters.cloudcoverMid.value] as String
          : null,
      cloudcoverHigh: json.containsKey(HourlyParameters.cloudcoverHigh.value)
          ? json[HourlyParameters.cloudcoverHigh.value] as String
          : null,
      visibility: json.containsKey(HourlyParameters.visibility.value)
          ? json[HourlyParameters.visibility.value] as String
          : null,
      evapotranspiration:
          json.containsKey(HourlyParameters.evapotranspiration.value)
              ? json[HourlyParameters.evapotranspiration.value] as String
              : null,
      et0FaoEvapotranspiration:
          json.containsKey(HourlyParameters.et0FaoEvapotranspiration.value)
              ? json[HourlyParameters.et0FaoEvapotranspiration.value] as String
              : null,
      vaporPressureDeficit:
          json.containsKey(HourlyParameters.vaporPressureDeficit.value)
              ? json[HourlyParameters.vaporPressureDeficit.value] as String
              : null,
      windspeed10M: json.containsKey(HourlyParameters.windspeed10M.value)
          ? json[HourlyParameters.windspeed10M.value] as String
          : null,
      windspeed80M: json.containsKey(HourlyParameters.windspeed80M.value)
          ? json[HourlyParameters.windspeed80M.value] as String
          : null,
      windspeed120M: json.containsKey(HourlyParameters.windspeed120M.value)
          ? json[HourlyParameters.windspeed120M.value] as String
          : null,
      windspeed180M: json.containsKey(HourlyParameters.windspeed180M.value)
          ? json[HourlyParameters.windspeed180M.value] as String
          : null,
      winddirection10M:
          json.containsKey(HourlyParameters.winddirection10M.value)
              ? json[HourlyParameters.winddirection10M.value] as String
              : null,
      winddirection80M:
          json.containsKey(HourlyParameters.winddirection80M.value)
              ? json[HourlyParameters.winddirection80M.value] as String
              : null,
      winddirection120M:
          json.containsKey(HourlyParameters.winddirection120M.value)
              ? json[HourlyParameters.winddirection120M.value] as String
              : null,
      winddirection180M:
          json.containsKey(HourlyParameters.winddirection180M.value)
              ? json[HourlyParameters.winddirection180M.value] as String
              : null,
      windgusts10M: json.containsKey(HourlyParameters.windgusts10M.value)
          ? json[HourlyParameters.windgusts10M.value] as String
          : null,
      temperature80M: json.containsKey(HourlyParameters.temperature80M.value)
          ? json[HourlyParameters.temperature80M.value] as String
          : null,
      temperature120M: json.containsKey(HourlyParameters.temperature120M.value)
          ? json[HourlyParameters.temperature120M.value] as String
          : null,
      temperature180M: json.containsKey(HourlyParameters.temperature180M.value)
          ? json[HourlyParameters.temperature180M.value] as String
          : null,
      soilTemperature0Cm:
          json.containsKey(HourlyParameters.soilTemperature0Cm.value)
              ? json[HourlyParameters.soilTemperature0Cm.value] as String
              : null,
      soilTemperature6Cm:
          json.containsKey(HourlyParameters.soilTemperature6Cm.value)
              ? json[HourlyParameters.soilTemperature6Cm.value] as String
              : null,
      soilTemperature18Cm:
          json.containsKey(HourlyParameters.soilTemperature18Cm.value)
              ? json[HourlyParameters.soilTemperature18Cm.value] as String
              : null,
      soilTemperature54Cm:
          json.containsKey(HourlyParameters.soilTemperature54Cm.value)
              ? json[HourlyParameters.soilTemperature54Cm.value] as String
              : null,
      soilMoisture0To1Cm:
          json.containsKey(HourlyParameters.soilMoisture0To1Cm.value)
              ? json[HourlyParameters.soilMoisture0To1Cm.value] as String
              : null,
      soilMoisture1To3Cm:
          json.containsKey(HourlyParameters.soilMoisture1To3Cm.value)
              ? json[HourlyParameters.soilMoisture1To3Cm.value] as String
              : null,
      soilMoisture3To9Cm:
          json.containsKey(HourlyParameters.soilMoisture3To9Cm.value)
              ? json[HourlyParameters.soilMoisture3To9Cm.value] as String
              : null,
      soilMoisture9To27Cm:
          json.containsKey(HourlyParameters.soilMoisture9To27Cm.value)
              ? json[HourlyParameters.soilMoisture9To27Cm.value] as String
              : null,
      soilMoisture27To81Cm:
          json.containsKey(HourlyParameters.soilMoisture27To81Cm.value)
              ? json[HourlyParameters.soilMoisture27To81Cm.value] as String
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time,
    };

    if (temperature2M != null) {
      map[HourlyParameters.temperature2M.value] = temperature2M;
    }

    if (relativehumidity2M != null) {
      map[HourlyParameters.relativehumidity2M.value] = relativehumidity2M;
    }

    if (dewpoint2M != null) {
      map[HourlyParameters.dewpoint2M.value] = dewpoint2M;
    }

    if (apparentTemperature != null) {
      map[HourlyParameters.apparentTemperature.value] = apparentTemperature;
    }

    if (precipitationProbability != null) {
      map[HourlyParameters.precipitationProbability.value] =
          precipitationProbability;
    }

    if (precipitation != null) {
      map[HourlyParameters.precipitation.value] = precipitation;
    }

    if (rain != null) {
      map[HourlyParameters.rain.value] = rain;
    }

    if (showers != null) {
      map[HourlyParameters.showers.value] = showers;
    }

    if (snowfall != null) {
      map[HourlyParameters.snowfall.value] = snowfall;
    }

    if (snowDepth != null) {
      map[HourlyParameters.snowDepth.value] = snowDepth;
    }

    if (weathercode != null) {
      map[HourlyParameters.weathercode.value] = weathercode;
    }

    if (pressureMsl != null) {
      map[HourlyParameters.pressureMsl.value] = pressureMsl;
    }

    if (surfacePressure != null) {
      map[HourlyParameters.surfacePressure.value] = surfacePressure;
    }

    if (cloudcover != null) {
      map[HourlyParameters.cloudcover.value] = cloudcover;
    }

    if (cloudcoverLow != null) {
      map[HourlyParameters.cloudcoverLow.value] = cloudcoverLow;
    }

    if (cloudcoverMid != null) {
      map[HourlyParameters.cloudcoverMid.value] = cloudcoverMid;
    }

    if (cloudcoverHigh != null) {
      map[HourlyParameters.cloudcoverHigh.value] = cloudcoverHigh;
    }

    if (visibility != null) {
      map[HourlyParameters.visibility.value] = visibility;
    }

    if (evapotranspiration != null) {
      map[HourlyParameters.evapotranspiration.value] = evapotranspiration;
    }

    if (et0FaoEvapotranspiration != null) {
      map[HourlyParameters.et0FaoEvapotranspiration.value] =
          et0FaoEvapotranspiration;
    }

    if (vaporPressureDeficit != null) {
      map[HourlyParameters.vaporPressureDeficit.value] = vaporPressureDeficit;
    }

    if (windspeed10M != null) {
      map[HourlyParameters.windspeed10M.value] = windspeed10M;
    }

    if (windspeed80M != null) {
      map[HourlyParameters.windspeed80M.value] = windspeed80M;
    }

    if (windspeed120M != null) {
      map[HourlyParameters.windspeed120M.value] = windspeed120M;
    }

    if (windspeed180M != null) {
      map[HourlyParameters.winddirection180M.value] = windspeed180M;
    }

    if (winddirection10M != null) {
      map[HourlyParameters.winddirection10M.value] = winddirection10M;
    }

    if (winddirection80M != null) {
      map[HourlyParameters.winddirection80M.value] = winddirection80M;
    }

    if (winddirection120M != null) {
      map[HourlyParameters.winddirection120M.value] = winddirection120M;
    }

    if (winddirection180M != null) {
      map[HourlyParameters.winddirection180M.value] = winddirection180M;
    }

    if (windgusts10M != null) {
      map[HourlyParameters.windgusts10M.value] = windgusts10M;
    }

    if (temperature80M != null) {
      map[HourlyParameters.temperature80M.value] = temperature80M;
    }

    if (temperature120M != null) {
      map[HourlyParameters.temperature120M.value] = temperature120M;
    }

    if (temperature180M != null) {
      map[HourlyParameters.temperature180M.value] = temperature180M;
    }

    if (soilTemperature0Cm != null) {
      map[HourlyParameters.soilTemperature0Cm.value] = soilTemperature0Cm;
    }

    if (soilTemperature6Cm != null) {
      map[HourlyParameters.soilTemperature6Cm.value] = soilTemperature6Cm;
    }

    if (soilTemperature18Cm != null) {
      map[HourlyParameters.soilTemperature18Cm.value] = soilTemperature18Cm;
    }

    if (soilTemperature54Cm != null) {
      map[HourlyParameters.soilTemperature54Cm.value] = soilTemperature54Cm;
    }

    if (soilMoisture0To1Cm != null) {
      map[HourlyParameters.soilMoisture0To1Cm.value] = soilMoisture0To1Cm;
    }

    if (soilMoisture1To3Cm != null) {
      map[HourlyParameters.soilMoisture1To3Cm.value] = soilMoisture1To3Cm;
    }

    if (soilMoisture3To9Cm != null) {
      map[HourlyParameters.soilMoisture3To9Cm.value] = soilMoisture3To9Cm;
    }

    if (soilMoisture9To27Cm != null) {
      map[HourlyParameters.soilMoisture9To27Cm.value] = soilMoisture9To27Cm;
    }

    if (soilMoisture27To81Cm != null) {
      map[HourlyParameters.soilMoisture27To81Cm.value] = soilMoisture27To81Cm;
    }

    return map;
  }
}
