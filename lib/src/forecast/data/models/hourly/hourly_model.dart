import 'dart:convert';

import 'package:anemoi_weather/src/forecast/data/api_strings.dart';
import 'package:anemoi_weather/src/forecast/data/utils/enum_extensions.dart';
import 'package:anemoi_weather/src/forecast/domain/entities/hourly.dart';
import 'package:anemoi_weather/src/forecast/domain/enums/enums.dart';

class HourlyModel extends Hourly {
  HourlyModel({
    required super.time,
    super.temperature2M = const [],
    super.relativehumidity2M = const [],
    super.dewpoint2M = const [],
    super.apparentTemperature = const [],
    super.precipitationProbability = const [],
    super.precipitation = const [],
    super.rain = const [],
    super.showers = const [],
    super.snowfall = const [],
    super.snowDepth = const [],
    super.weathercode = const [],
    super.pressureMsl = const [],
    super.surfacePressure = const [],
    super.cloudcover = const [],
    super.cloudcoverLow = const [],
    super.cloudcoverMid = const [],
    super.cloudcoverHigh = const [],
    super.visibility = const [],
    super.evapotranspiration = const [],
    super.et0FaoEvapotranspiration = const [],
    super.vaporPressureDeficit = const [],
    super.windspeed10M = const [],
    super.windspeed80M = const [],
    super.windspeed120M = const [],
    super.windspeed180M = const [],
    super.winddirection10M = const [],
    super.winddirection80M = const [],
    super.winddirection120M = const [],
    super.winddirection180M = const [],
    super.windgusts10M = const [],
    super.temperature80M = const [],
    super.temperature120M = const [],
    super.temperature180M = const [],
    super.soilTemperature0Cm = const [],
    super.soilTemperature6Cm = const [],
    super.soilTemperature18Cm = const [],
    super.soilTemperature54Cm = const [],
    super.soilMoisture0To1Cm = const [],
    super.soilMoisture1To3Cm = const [],
    super.soilMoisture3To9Cm = const [],
    super.soilMoisture9To27Cm = const [],
    super.soilMoisture27To81Cm = const [],
  });

  HourlyModel.fromDomain(Hourly hourly)
      : this(
          time: hourly.time,
          apparentTemperature: hourly.apparentTemperature,
          cloudcover: hourly.cloudcover,
          cloudcoverHigh: hourly.cloudcoverHigh,
          cloudcoverLow: hourly.cloudcoverLow,
          cloudcoverMid: hourly.cloudcoverMid,
          dewpoint2M: hourly.dewpoint2M,
          et0FaoEvapotranspiration: hourly.et0FaoEvapotranspiration,
          evapotranspiration: hourly.evapotranspiration,
          precipitation: hourly.precipitation,
          precipitationProbability: hourly.precipitationProbability,
          pressureMsl: hourly.pressureMsl,
          rain: hourly.rain,
          relativehumidity2M: hourly.relativehumidity2M,
          showers: hourly.showers,
          snowDepth: hourly.snowDepth,
          snowfall: hourly.snowfall,
          soilMoisture0To1Cm: hourly.soilMoisture0To1Cm,
          soilMoisture1To3Cm: hourly.soilMoisture1To3Cm,
          soilMoisture27To81Cm: hourly.soilMoisture27To81Cm,
          soilMoisture3To9Cm: hourly.soilMoisture3To9Cm,
          soilMoisture9To27Cm: hourly.soilMoisture9To27Cm,
          soilTemperature0Cm: hourly.soilTemperature0Cm,
          soilTemperature18Cm: hourly.soilTemperature18Cm,
          soilTemperature54Cm: hourly.soilTemperature54Cm,
          soilTemperature6Cm: hourly.soilTemperature6Cm,
          surfacePressure: hourly.surfacePressure,
          temperature120M: hourly.temperature120M,
          temperature180M: hourly.temperature180M,
          temperature2M: hourly.temperature2M,
          temperature80M: hourly.temperature80M,
          vaporPressureDeficit: hourly.vaporPressureDeficit,
          visibility: hourly.visibility,
          weathercode: hourly.weathercode,
          winddirection10M: hourly.winddirection10M,
          winddirection120M: hourly.winddirection120M,
          winddirection180M: hourly.winddirection180M,
          winddirection80M: hourly.winddirection80M,
          windgusts10M: hourly.windgusts10M,
          windspeed10M: hourly.windspeed10M,
          windspeed120M: hourly.windspeed120M,
          windspeed180M: hourly.windspeed180M,
          windspeed80M: hourly.windspeed80M,
        );

  factory HourlyModel.fromJson(Map<String, dynamic> json) {
    return HourlyModel(
      time: List<int>.from(json[ApiStrings.time])
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
