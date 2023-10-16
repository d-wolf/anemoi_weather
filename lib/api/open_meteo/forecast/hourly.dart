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
      temperature2M: json.containsKey(HourlyQueryParameters.temperature2M.value)
          ? List<double>.from(json[HourlyQueryParameters.temperature2M.value])
          : [],
      relativehumidity2M: json
              .containsKey(HourlyQueryParameters.relativehumidity2M.value)
          ? List<int>.from(json[HourlyQueryParameters.relativehumidity2M.value])
          : [],
      dewpoint2M: json.containsKey(HourlyQueryParameters.dewpoint2M.value)
          ? List<double>.from(json[HourlyQueryParameters.dewpoint2M.value])
          : [],
      apparentTemperature:
          json.containsKey(HourlyQueryParameters.apparentTemperature.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.apparentTemperature.value])
              : [],
      precipitationProbability:
          json.containsKey(HourlyQueryParameters.precipitationProbability.value)
              ? List<int>.from(
                  json[HourlyQueryParameters.precipitationProbability.value])
              : [],
      precipitation: json.containsKey(HourlyQueryParameters.precipitation.value)
          ? List<double>.from(json[HourlyQueryParameters.precipitation.value])
          : [],
      rain: json.containsKey(HourlyQueryParameters.rain.value)
          ? List<double>.from(json[HourlyQueryParameters.rain.value])
          : [],
      showers: json.containsKey(HourlyQueryParameters.showers.value)
          ? List<double>.from(json[HourlyQueryParameters.showers.value])
          : [],
      snowfall: json.containsKey(HourlyQueryParameters.snowfall.value)
          ? List<double>.from(json[HourlyQueryParameters.snowfall.value])
          : [],
      snowDepth: json.containsKey(HourlyQueryParameters.snowDepth.value)
          ? List<double>.from(json[HourlyQueryParameters.snowDepth.value])
          : [],
      weathercode: json.containsKey(HourlyQueryParameters.weathercode.value)
          ? List<int>.from(json[HourlyQueryParameters.weathercode.value])
          : [],
      pressureMsl: json.containsKey(HourlyQueryParameters.pressureMsl.value)
          ? List<double>.from(json[HourlyQueryParameters.pressureMsl.value])
          : [],
      surfacePressure: json
              .containsKey(HourlyQueryParameters.surfacePressure.value)
          ? List<double>.from(json[HourlyQueryParameters.surfacePressure.value])
          : [],
      cloudcover: json.containsKey(HourlyQueryParameters.cloudcover.value)
          ? List<int>.from(json[HourlyQueryParameters.cloudcover.value])
          : [],
      cloudcoverLow: json.containsKey(HourlyQueryParameters.cloudcoverLow.value)
          ? List<int>.from(json[HourlyQueryParameters.cloudcoverLow.value])
          : [],
      cloudcoverMid: json.containsKey(HourlyQueryParameters.cloudcoverMid.value)
          ? List<int>.from(json[HourlyQueryParameters.cloudcoverMid.value])
          : [],
      cloudcoverHigh:
          json.containsKey(HourlyQueryParameters.cloudcoverHigh.value)
              ? List<int>.from(json[HourlyQueryParameters.cloudcoverHigh.value])
              : [],
      visibility: json.containsKey(HourlyQueryParameters.visibility.value)
          ? List<int>.from(json[HourlyQueryParameters.visibility.value])
          : [],
      evapotranspiration:
          json.containsKey(HourlyQueryParameters.evapotranspiration.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.evapotranspiration.value])
              : [],
      et0FaoEvapotranspiration:
          json.containsKey(HourlyQueryParameters.et0FaoEvapotranspiration.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.et0FaoEvapotranspiration.value])
              : [],
      vaporPressureDeficit:
          json.containsKey(HourlyQueryParameters.vaporPressureDeficit.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.vaporPressureDeficit.value])
              : [],
      windspeed10M: json.containsKey(HourlyQueryParameters.windspeed10M.value)
          ? List<double>.from(json[HourlyQueryParameters.windspeed10M.value])
          : [],
      windspeed80M: json.containsKey(HourlyQueryParameters.windspeed80M.value)
          ? List<double>.from(json[HourlyQueryParameters.windspeed80M.value])
          : [],
      windspeed120M: json.containsKey(HourlyQueryParameters.windspeed120M.value)
          ? List<double>.from(json[HourlyQueryParameters.windspeed120M.value])
          : [],
      windspeed180M: json.containsKey(HourlyQueryParameters.windspeed180M.value)
          ? List<double>.from(json[HourlyQueryParameters.windspeed180M.value])
          : [],
      winddirection10M: json
              .containsKey(HourlyQueryParameters.winddirection10M.value)
          ? List<int>.from(json[HourlyQueryParameters.winddirection10M.value])
          : [],
      winddirection80M: json
              .containsKey(HourlyQueryParameters.winddirection80M.value)
          ? List<int>.from(json[HourlyQueryParameters.winddirection80M.value])
          : [],
      winddirection120M: json
              .containsKey(HourlyQueryParameters.winddirection120M.value)
          ? List<int>.from(json[HourlyQueryParameters.winddirection120M.value])
          : [],
      winddirection180M: json
              .containsKey(HourlyQueryParameters.winddirection180M.value)
          ? List<int>.from(json[HourlyQueryParameters.winddirection180M.value])
          : [],
      windgusts10M: json.containsKey(HourlyQueryParameters.windgusts10M.value)
          ? List<double>.from(json[HourlyQueryParameters.windgusts10M.value])
          : [],
      temperature80M: json
              .containsKey(HourlyQueryParameters.temperature80M.value)
          ? List<double>.from(json[HourlyQueryParameters.temperature80M.value])
          : [],
      temperature120M: json
              .containsKey(HourlyQueryParameters.temperature120M.value)
          ? List<double>.from(json[HourlyQueryParameters.temperature120M.value])
          : [],
      temperature180M: json
              .containsKey(HourlyQueryParameters.temperature180M.value)
          ? List<double>.from(json[HourlyQueryParameters.temperature180M.value])
          : [],
      soilTemperature0Cm:
          json.containsKey(HourlyQueryParameters.soilTemperature0Cm.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.soilTemperature0Cm.value])
              : [],
      soilTemperature6Cm:
          json.containsKey(HourlyQueryParameters.soilTemperature6Cm.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.soilTemperature6Cm.value])
              : [],
      soilTemperature18Cm:
          json.containsKey(HourlyQueryParameters.soilTemperature18Cm.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.soilTemperature18Cm.value])
              : [],
      soilTemperature54Cm:
          json.containsKey(HourlyQueryParameters.soilTemperature54Cm.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.soilTemperature54Cm.value])
              : [],
      soilMoisture0To1Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture0To1Cm.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.soilMoisture0To1Cm.value])
              : [],
      soilMoisture1To3Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture1To3Cm.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.soilMoisture1To3Cm.value])
              : [],
      soilMoisture3To9Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture3To9Cm.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.soilMoisture3To9Cm.value])
              : [],
      soilMoisture9To27Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture9To27Cm.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.soilMoisture9To27Cm.value])
              : [],
      soilMoisture27To81Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture27To81Cm.value)
              ? List<double>.from(
                  json[HourlyQueryParameters.soilMoisture27To81Cm.value])
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': jsonEncode(
          time.map((e) => e.millisecondsSinceEpoch ~/ 1000).toList()),
    };

    if (temperature2M.isNotEmpty) {
      map[HourlyQueryParameters.temperature2M.value] =
          jsonEncode(temperature2M);
    }

    if (relativehumidity2M.isNotEmpty) {
      map[HourlyQueryParameters.relativehumidity2M.value] =
          jsonEncode(relativehumidity2M);
    }

    if (dewpoint2M.isNotEmpty) {
      map[HourlyQueryParameters.dewpoint2M.value] = jsonEncode(dewpoint2M);
    }

    if (apparentTemperature.isNotEmpty) {
      map[HourlyQueryParameters.apparentTemperature.value] =
          jsonEncode(apparentTemperature);
    }

    if (precipitationProbability.isNotEmpty) {
      map[HourlyQueryParameters.precipitationProbability.value] =
          jsonEncode(precipitationProbability);
    }

    if (precipitation.isNotEmpty) {
      map[HourlyQueryParameters.precipitation.value] =
          jsonEncode(precipitation);
    }

    if (rain.isNotEmpty) {
      map[HourlyQueryParameters.rain.value] = jsonEncode(rain);
    }

    if (showers.isNotEmpty) {
      map[HourlyQueryParameters.showers.value] = jsonEncode(showers);
    }

    if (snowfall.isNotEmpty) {
      map[HourlyQueryParameters.snowfall.value] = jsonEncode(snowfall);
    }

    if (snowDepth.isNotEmpty) {
      map[HourlyQueryParameters.snowDepth.value] = jsonEncode(snowDepth);
    }

    if (weathercode.isNotEmpty) {
      map[HourlyQueryParameters.weathercode.value] = jsonEncode(weathercode);
    }

    if (pressureMsl.isNotEmpty) {
      map[HourlyQueryParameters.pressureMsl.value] = jsonEncode(pressureMsl);
    }

    if (surfacePressure.isNotEmpty) {
      map[HourlyQueryParameters.surfacePressure.value] =
          jsonEncode(surfacePressure);
    }

    if (cloudcover.isNotEmpty) {
      map[HourlyQueryParameters.cloudcover.value] = jsonEncode(cloudcover);
    }

    if (cloudcoverLow.isNotEmpty) {
      map[HourlyQueryParameters.cloudcoverLow.value] =
          jsonEncode(cloudcoverLow);
    }

    if (cloudcoverMid.isNotEmpty) {
      map[HourlyQueryParameters.cloudcoverMid.value] =
          jsonEncode(cloudcoverMid);
    }

    if (cloudcoverHigh.isNotEmpty) {
      map[HourlyQueryParameters.cloudcoverHigh.value] =
          jsonEncode(cloudcoverHigh);
    }

    if (visibility.isNotEmpty) {
      map[HourlyQueryParameters.visibility.value] = jsonEncode(visibility);
    }

    if (evapotranspiration.isNotEmpty) {
      map[HourlyQueryParameters.evapotranspiration.value] =
          jsonEncode(evapotranspiration);
    }

    if (et0FaoEvapotranspiration.isNotEmpty) {
      map[HourlyQueryParameters.et0FaoEvapotranspiration.value] =
          jsonEncode(et0FaoEvapotranspiration);
    }

    if (vaporPressureDeficit.isNotEmpty) {
      map[HourlyQueryParameters.vaporPressureDeficit.value] =
          jsonEncode(vaporPressureDeficit);
    }

    if (windspeed10M.isNotEmpty) {
      map[HourlyQueryParameters.windspeed10M.value] = jsonEncode(windspeed10M);
    }

    if (windspeed80M.isNotEmpty) {
      map[HourlyQueryParameters.windspeed80M.value] = jsonEncode(windspeed80M);
    }

    if (windspeed120M.isNotEmpty) {
      map[HourlyQueryParameters.winddirection120M.value] =
          jsonEncode(windspeed120M);
    }

    if (windspeed180M.isNotEmpty) {
      map[HourlyQueryParameters.winddirection180M.value] =
          jsonEncode(windspeed180M);
    }

    if (winddirection10M.isNotEmpty) {
      map[HourlyQueryParameters.winddirection10M.value] =
          jsonEncode(winddirection10M);
    }

    if (winddirection80M.isNotEmpty) {
      map[HourlyQueryParameters.winddirection80M.value] =
          jsonEncode(winddirection80M);
    }

    if (winddirection120M.isNotEmpty) {
      map[HourlyQueryParameters.winddirection120M.value] =
          jsonEncode(winddirection120M);
    }

    if (winddirection180M.isNotEmpty) {
      map[HourlyQueryParameters.winddirection180M.value] =
          jsonEncode(winddirection180M);
    }

    if (windgusts10M.isNotEmpty) {
      map[HourlyQueryParameters.windgusts10M.value] = jsonEncode(windgusts10M);
    }

    if (temperature80M.isNotEmpty) {
      map[HourlyQueryParameters.temperature80M.value] =
          jsonEncode(temperature80M);
    }

    if (temperature120M.isNotEmpty) {
      map[HourlyQueryParameters.temperature120M.value] =
          jsonEncode(temperature120M);
    }

    if (temperature180M.isNotEmpty) {
      map[HourlyQueryParameters.temperature180M.value] =
          jsonEncode(temperature180M);
    }

    if (soilTemperature0Cm.isNotEmpty) {
      map[HourlyQueryParameters.soilTemperature0Cm.value] =
          jsonEncode(soilTemperature0Cm);
    }

    if (soilTemperature6Cm.isNotEmpty) {
      map[HourlyQueryParameters.soilTemperature6Cm.value] =
          jsonEncode(soilTemperature6Cm);
    }

    if (soilTemperature18Cm.isNotEmpty) {
      map[HourlyQueryParameters.soilTemperature18Cm.value] =
          jsonEncode(soilTemperature18Cm);
    }

    if (soilTemperature54Cm.isNotEmpty) {
      map[HourlyQueryParameters.soilTemperature54Cm.value] =
          jsonEncode(soilTemperature54Cm);
    }

    if (soilMoisture0To1Cm.isNotEmpty) {
      map[HourlyQueryParameters.soilMoisture0To1Cm.value] =
          jsonEncode(soilMoisture0To1Cm);
    }

    if (soilMoisture1To3Cm.isNotEmpty) {
      map[HourlyQueryParameters.soilMoisture1To3Cm.value] =
          jsonEncode(soilMoisture1To3Cm);
    }

    if (soilMoisture3To9Cm.isNotEmpty) {
      map[HourlyQueryParameters.soilMoisture3To9Cm.value] =
          jsonEncode(soilMoisture3To9Cm);
    }

    if (soilMoisture9To27Cm.isNotEmpty) {
      map[HourlyQueryParameters.soilMoisture9To27Cm.value] =
          jsonEncode(soilMoisture9To27Cm);
    }

    if (soilMoisture27To81Cm.isNotEmpty) {
      map[HourlyQueryParameters.soilMoisture27To81Cm.value] =
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
      temperature2M: json.containsKey(HourlyQueryParameters.temperature2M.value)
          ? json[HourlyQueryParameters.temperature2M.value] as String
          : null,
      relativehumidity2M:
          json.containsKey(HourlyQueryParameters.relativehumidity2M.value)
              ? json[HourlyQueryParameters.relativehumidity2M.value] as String
              : null,
      dewpoint2M: json.containsKey(HourlyQueryParameters.dewpoint2M.value)
          ? json[HourlyQueryParameters.dewpoint2M.value] as String
          : null,
      apparentTemperature:
          json.containsKey(HourlyQueryParameters.apparentTemperature.value)
              ? json[HourlyQueryParameters.apparentTemperature.value] as String
              : null,
      precipitationProbability: json
              .containsKey(HourlyQueryParameters.precipitationProbability.value)
          ? json[HourlyQueryParameters.precipitationProbability.value] as String
          : null,
      precipitation: json.containsKey(HourlyQueryParameters.precipitation.value)
          ? json[HourlyQueryParameters.precipitation.value] as String
          : null,
      rain: json.containsKey(HourlyQueryParameters.rain.value)
          ? json[HourlyQueryParameters.rain.value] as String
          : null,
      showers: json.containsKey(HourlyQueryParameters.showers.value)
          ? json[HourlyQueryParameters.showers.value] as String
          : null,
      snowfall: json.containsKey(HourlyQueryParameters.snowfall.value)
          ? json[HourlyQueryParameters.snowfall.value] as String
          : null,
      snowDepth: json.containsKey(HourlyQueryParameters.snowDepth.value)
          ? json[HourlyQueryParameters.snowDepth.value] as String
          : null,
      weathercode: json.containsKey(HourlyQueryParameters.weathercode.value)
          ? json[HourlyQueryParameters.weathercode.value] as String
          : null,
      pressureMsl: json.containsKey(HourlyQueryParameters.pressureMsl.value)
          ? json[HourlyQueryParameters.pressureMsl.value] as String
          : null,
      surfacePressure:
          json.containsKey(HourlyQueryParameters.surfacePressure.value)
              ? json[HourlyQueryParameters.surfacePressure.value] as String
              : null,
      cloudcover: json.containsKey(HourlyQueryParameters.cloudcover.value)
          ? json[HourlyQueryParameters.cloudcover.value] as String
          : null,
      cloudcoverLow: json.containsKey(HourlyQueryParameters.cloudcoverLow.value)
          ? json[HourlyQueryParameters.cloudcoverLow.value] as String
          : null,
      cloudcoverMid: json.containsKey(HourlyQueryParameters.cloudcoverMid.value)
          ? json[HourlyQueryParameters.cloudcoverMid.value] as String
          : null,
      cloudcoverHigh:
          json.containsKey(HourlyQueryParameters.cloudcoverHigh.value)
              ? json[HourlyQueryParameters.cloudcoverHigh.value] as String
              : null,
      visibility: json.containsKey(HourlyQueryParameters.visibility.value)
          ? json[HourlyQueryParameters.visibility.value] as String
          : null,
      evapotranspiration:
          json.containsKey(HourlyQueryParameters.evapotranspiration.value)
              ? json[HourlyQueryParameters.evapotranspiration.value] as String
              : null,
      et0FaoEvapotranspiration: json
              .containsKey(HourlyQueryParameters.et0FaoEvapotranspiration.value)
          ? json[HourlyQueryParameters.et0FaoEvapotranspiration.value] as String
          : null,
      vaporPressureDeficit:
          json.containsKey(HourlyQueryParameters.vaporPressureDeficit.value)
              ? json[HourlyQueryParameters.vaporPressureDeficit.value] as String
              : null,
      windspeed10M: json.containsKey(HourlyQueryParameters.windspeed10M.value)
          ? json[HourlyQueryParameters.windspeed10M.value] as String
          : null,
      windspeed80M: json.containsKey(HourlyQueryParameters.windspeed80M.value)
          ? json[HourlyQueryParameters.windspeed80M.value] as String
          : null,
      windspeed120M: json.containsKey(HourlyQueryParameters.windspeed120M.value)
          ? json[HourlyQueryParameters.windspeed120M.value] as String
          : null,
      windspeed180M: json.containsKey(HourlyQueryParameters.windspeed180M.value)
          ? json[HourlyQueryParameters.windspeed180M.value] as String
          : null,
      winddirection10M:
          json.containsKey(HourlyQueryParameters.winddirection10M.value)
              ? json[HourlyQueryParameters.winddirection10M.value] as String
              : null,
      winddirection80M:
          json.containsKey(HourlyQueryParameters.winddirection80M.value)
              ? json[HourlyQueryParameters.winddirection80M.value] as String
              : null,
      winddirection120M:
          json.containsKey(HourlyQueryParameters.winddirection120M.value)
              ? json[HourlyQueryParameters.winddirection120M.value] as String
              : null,
      winddirection180M:
          json.containsKey(HourlyQueryParameters.winddirection180M.value)
              ? json[HourlyQueryParameters.winddirection180M.value] as String
              : null,
      windgusts10M: json.containsKey(HourlyQueryParameters.windgusts10M.value)
          ? json[HourlyQueryParameters.windgusts10M.value] as String
          : null,
      temperature80M:
          json.containsKey(HourlyQueryParameters.temperature80M.value)
              ? json[HourlyQueryParameters.temperature80M.value] as String
              : null,
      temperature120M:
          json.containsKey(HourlyQueryParameters.temperature120M.value)
              ? json[HourlyQueryParameters.temperature120M.value] as String
              : null,
      temperature180M:
          json.containsKey(HourlyQueryParameters.temperature180M.value)
              ? json[HourlyQueryParameters.temperature180M.value] as String
              : null,
      soilTemperature0Cm:
          json.containsKey(HourlyQueryParameters.soilTemperature0Cm.value)
              ? json[HourlyQueryParameters.soilTemperature0Cm.value] as String
              : null,
      soilTemperature6Cm:
          json.containsKey(HourlyQueryParameters.soilTemperature6Cm.value)
              ? json[HourlyQueryParameters.soilTemperature6Cm.value] as String
              : null,
      soilTemperature18Cm:
          json.containsKey(HourlyQueryParameters.soilTemperature18Cm.value)
              ? json[HourlyQueryParameters.soilTemperature18Cm.value] as String
              : null,
      soilTemperature54Cm:
          json.containsKey(HourlyQueryParameters.soilTemperature54Cm.value)
              ? json[HourlyQueryParameters.soilTemperature54Cm.value] as String
              : null,
      soilMoisture0To1Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture0To1Cm.value)
              ? json[HourlyQueryParameters.soilMoisture0To1Cm.value] as String
              : null,
      soilMoisture1To3Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture1To3Cm.value)
              ? json[HourlyQueryParameters.soilMoisture1To3Cm.value] as String
              : null,
      soilMoisture3To9Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture3To9Cm.value)
              ? json[HourlyQueryParameters.soilMoisture3To9Cm.value] as String
              : null,
      soilMoisture9To27Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture9To27Cm.value)
              ? json[HourlyQueryParameters.soilMoisture9To27Cm.value] as String
              : null,
      soilMoisture27To81Cm:
          json.containsKey(HourlyQueryParameters.soilMoisture27To81Cm.value)
              ? json[HourlyQueryParameters.soilMoisture27To81Cm.value] as String
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time,
    };

    if (temperature2M != null) {
      map[HourlyQueryParameters.temperature2M.value] = temperature2M;
    }

    if (relativehumidity2M != null) {
      map[HourlyQueryParameters.relativehumidity2M.value] = relativehumidity2M;
    }

    if (dewpoint2M != null) {
      map[HourlyQueryParameters.dewpoint2M.value] = dewpoint2M;
    }

    if (apparentTemperature != null) {
      map[HourlyQueryParameters.apparentTemperature.value] =
          apparentTemperature;
    }

    if (precipitationProbability != null) {
      map[HourlyQueryParameters.precipitationProbability.value] =
          precipitationProbability;
    }

    if (precipitation != null) {
      map[HourlyQueryParameters.precipitation.value] = precipitation;
    }

    if (rain != null) {
      map[HourlyQueryParameters.rain.value] = rain;
    }

    if (showers != null) {
      map[HourlyQueryParameters.showers.value] = showers;
    }

    if (snowfall != null) {
      map[HourlyQueryParameters.snowfall.value] = snowfall;
    }

    if (snowDepth != null) {
      map[HourlyQueryParameters.snowDepth.value] = snowDepth;
    }

    if (weathercode != null) {
      map[HourlyQueryParameters.weathercode.value] = weathercode;
    }

    if (pressureMsl != null) {
      map[HourlyQueryParameters.pressureMsl.value] = pressureMsl;
    }

    if (surfacePressure != null) {
      map[HourlyQueryParameters.surfacePressure.value] = surfacePressure;
    }

    if (cloudcover != null) {
      map[HourlyQueryParameters.cloudcover.value] = cloudcover;
    }

    if (cloudcoverLow != null) {
      map[HourlyQueryParameters.cloudcoverLow.value] = cloudcoverLow;
    }

    if (cloudcoverMid != null) {
      map[HourlyQueryParameters.cloudcoverMid.value] = cloudcoverMid;
    }

    if (cloudcoverHigh != null) {
      map[HourlyQueryParameters.cloudcoverHigh.value] = cloudcoverHigh;
    }

    if (visibility != null) {
      map[HourlyQueryParameters.visibility.value] = visibility;
    }

    if (evapotranspiration != null) {
      map[HourlyQueryParameters.evapotranspiration.value] = evapotranspiration;
    }

    if (et0FaoEvapotranspiration != null) {
      map[HourlyQueryParameters.et0FaoEvapotranspiration.value] =
          et0FaoEvapotranspiration;
    }

    if (vaporPressureDeficit != null) {
      map[HourlyQueryParameters.vaporPressureDeficit.value] =
          vaporPressureDeficit;
    }

    if (windspeed10M != null) {
      map[HourlyQueryParameters.windspeed10M.value] = windspeed10M;
    }

    if (windspeed80M != null) {
      map[HourlyQueryParameters.windspeed80M.value] = windspeed80M;
    }

    if (windspeed120M != null) {
      map[HourlyQueryParameters.windspeed120M.value] = windspeed120M;
    }

    if (windspeed180M != null) {
      map[HourlyQueryParameters.winddirection180M.value] = windspeed180M;
    }

    if (winddirection10M != null) {
      map[HourlyQueryParameters.winddirection10M.value] = winddirection10M;
    }

    if (winddirection80M != null) {
      map[HourlyQueryParameters.winddirection80M.value] = winddirection80M;
    }

    if (winddirection120M != null) {
      map[HourlyQueryParameters.winddirection120M.value] = winddirection120M;
    }

    if (winddirection180M != null) {
      map[HourlyQueryParameters.winddirection180M.value] = winddirection180M;
    }

    if (windgusts10M != null) {
      map[HourlyQueryParameters.windgusts10M.value] = windgusts10M;
    }

    if (temperature80M != null) {
      map[HourlyQueryParameters.temperature80M.value] = temperature80M;
    }

    if (temperature120M != null) {
      map[HourlyQueryParameters.temperature120M.value] = temperature120M;
    }

    if (temperature180M != null) {
      map[HourlyQueryParameters.temperature180M.value] = temperature180M;
    }

    if (soilTemperature0Cm != null) {
      map[HourlyQueryParameters.soilTemperature0Cm.value] = soilTemperature0Cm;
    }

    if (soilTemperature6Cm != null) {
      map[HourlyQueryParameters.soilTemperature6Cm.value] = soilTemperature6Cm;
    }

    if (soilTemperature18Cm != null) {
      map[HourlyQueryParameters.soilTemperature18Cm.value] =
          soilTemperature18Cm;
    }

    if (soilTemperature54Cm != null) {
      map[HourlyQueryParameters.soilTemperature54Cm.value] =
          soilTemperature54Cm;
    }

    if (soilMoisture0To1Cm != null) {
      map[HourlyQueryParameters.soilMoisture0To1Cm.value] = soilMoisture0To1Cm;
    }

    if (soilMoisture1To3Cm != null) {
      map[HourlyQueryParameters.soilMoisture1To3Cm.value] = soilMoisture1To3Cm;
    }

    if (soilMoisture3To9Cm != null) {
      map[HourlyQueryParameters.soilMoisture3To9Cm.value] = soilMoisture3To9Cm;
    }

    if (soilMoisture9To27Cm != null) {
      map[HourlyQueryParameters.soilMoisture9To27Cm.value] =
          soilMoisture9To27Cm;
    }

    if (soilMoisture27To81Cm != null) {
      map[HourlyQueryParameters.soilMoisture27To81Cm.value] =
          soilMoisture27To81Cm;
    }

    return map;
  }
}
