import 'dart:convert';

import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/data/forecast/api_strings.dart';
import 'package:anemoi_weather/src/data/forecast/utils/enum_extensions.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/daily.dart';
import 'package:anemoi_weather/src/domain/forecast/enums/enums.dart';

class DailyModel extends Daily {
  DailyModel({
    required super.time,
    super.weathercode = const [],
    super.temperature2MMax = const [],
    super.temperature2MMin = const [],
    super.apparentTemperatureMax = const [],
    super.apparentTemperatureMin = const [],
    super.sunrise = const [],
    super.sunset = const [],
    super.uvIndexMax = const [],
    super.uvIndexClearSkyMax = const [],
    super.precipitationSum = const [],
    super.rainSum = const [],
    super.showersSum = const [],
    super.snowfallSum = const [],
    super.precipitationHours = const [],
    super.precipitationProbabilityMax = const [],
    super.windspeed10MMax = const [],
    super.windgusts10MMax = const [],
    super.winddirection10MDominant = const [],
    super.shortwaveRadiationSum = const [],
    super.et0FaoEvapotranspiration = const [],
  });

  DailyModel.fromDomain(Daily daily)
      : this(
          time: daily.time,
          apparentTemperatureMax: daily.apparentTemperatureMax,
          apparentTemperatureMin: daily.apparentTemperatureMin,
          et0FaoEvapotranspiration: daily.et0FaoEvapotranspiration,
          precipitationHours: daily.precipitationHours,
          precipitationProbabilityMax: daily.precipitationProbabilityMax,
          precipitationSum: daily.precipitationSum,
          rainSum: daily.rainSum,
          shortwaveRadiationSum: daily.shortwaveRadiationSum,
          showersSum: daily.showersSum,
          snowfallSum: daily.snowfallSum,
          sunrise: daily.sunrise,
          sunset: daily.sunset,
          temperature2MMax: daily.temperature2MMax,
          temperature2MMin: daily.temperature2MMin,
          uvIndexClearSkyMax: daily.uvIndexClearSkyMax,
          uvIndexMax: daily.uvIndexMax,
          weathercode: daily.weathercode,
          winddirection10MDominant: daily.winddirection10MDominant,
          windgusts10MMax: daily.windgusts10MMax,
          windspeed10MMax: daily.windspeed10MMax,
        );

  factory DailyModel.fromJson(DataMap json) {
    return DailyModel(
      time: List<int>.from(json[ApiStrings.time])
          .map(
              (e) => DateTime.fromMillisecondsSinceEpoch(e * 1000, isUtc: true))
          .toList(),
      temperature2MMax: json.containsKey(DailyParameters.temperature2MMax.value)
          ? List<double>.from(json[DailyParameters.temperature2MMax.value])
          : [],
      temperature2MMin: json.containsKey(DailyParameters.temperature2MMin.value)
          ? List<double>.from(json[DailyParameters.temperature2MMin.value])
          : [],
      apparentTemperatureMax:
          json.containsKey(DailyParameters.apparentTemperatureMax.value)
              ? List<double>.from(
                  json[DailyParameters.apparentTemperatureMax.value])
              : [],
      apparentTemperatureMin:
          json.containsKey(DailyParameters.apparentTemperatureMin.value)
              ? List<double>.from(
                  json[DailyParameters.apparentTemperatureMin.value])
              : [],
      sunrise: json.containsKey(DailyParameters.sunrise.value)
          ? List<String>.from(json[DailyParameters.sunrise.value])
          : [],
      sunset: json.containsKey(DailyParameters.sunset.value)
          ? List<String>.from(json[DailyParameters.sunset.value])
          : [],
      uvIndexMax: json.containsKey(DailyParameters.uvIndexMax.value)
          ? List<double>.from(json[DailyParameters.uvIndexMax.value])
          : [],
      uvIndexClearSkyMax: json
              .containsKey(DailyParameters.uvIndexClearSkyMax.value)
          ? List<double>.from(json[DailyParameters.uvIndexClearSkyMax.value])
          : [],
      precipitationSum: json.containsKey(DailyParameters.precipitationSum.value)
          ? List<double>.from(json[DailyParameters.precipitationSum.value])
          : [],
      rainSum: json.containsKey(DailyParameters.rainSum.value)
          ? List<double>.from(json[DailyParameters.rainSum.value])
          : [],
      showersSum: json.containsKey(DailyParameters.showersSum.value)
          ? List<int>.from(json[DailyParameters.showersSum.value])
          : [],
      snowfallSum: json.containsKey(DailyParameters.snowfallSum.value)
          ? List<double>.from(json[DailyParameters.snowfallSum.value])
          : [],
      precipitationHours:
          json.containsKey(DailyParameters.precipitationHours.value)
              ? List<int>.from(json[DailyParameters.precipitationHours.value])
              : [],
      precipitationProbabilityMax:
          json.containsKey(DailyParameters.precipitationProbabilityMax.value)
              ? List<int>.from(
                  json[DailyParameters.precipitationProbabilityMax.value])
              : [],
      windspeed10MMax: json.containsKey(DailyParameters.windspeed10MMax.value)
          ? List<double>.from(json[DailyParameters.windspeed10MMax.value])
          : [],
      windgusts10MMax: json.containsKey(DailyParameters.windgusts10MMax.value)
          ? List<double>.from(json[DailyParameters.windgusts10MMax.value])
          : [],
      winddirection10MDominant: json
              .containsKey(DailyParameters.winddirection10MDominant.value)
          ? List<int>.from(json[DailyParameters.winddirection10MDominant.value])
          : [],
      shortwaveRadiationSum: json
              .containsKey(DailyParameters.shortwaveRadiationSum.value)
          ? List<double>.from(json[DailyParameters.shortwaveRadiationSum.value])
          : [],
      et0FaoEvapotranspiration:
          json.containsKey(DailyParameters.et0FaoEvapotranspiration.value)
              ? List<double>.from(
                  json[DailyParameters.et0FaoEvapotranspiration.value])
              : [],
    );
  }

  DataMap toJson() {
    final map = <String, dynamic>{
      ApiStrings.time: jsonEncode(
          time.map((e) => e.millisecondsSinceEpoch ~/ 1000).toList()),
    };

    if (temperature2MMax.isNotEmpty) {
      map[DailyParameters.temperature2MMax.value] =
          jsonEncode(temperature2MMax);
    }

    if (temperature2MMin.isNotEmpty) {
      map[DailyParameters.temperature2MMin.value] =
          jsonEncode(temperature2MMin);
    }

    if (apparentTemperatureMax.isNotEmpty) {
      map[DailyParameters.apparentTemperatureMax.value] =
          jsonEncode(apparentTemperatureMax);
    }

    if (apparentTemperatureMin.isNotEmpty) {
      map[DailyParameters.apparentTemperatureMin.value] =
          jsonEncode(apparentTemperatureMin);
    }

    if (sunrise.isNotEmpty) {
      map[DailyParameters.sunrise.value] = jsonEncode(sunrise);
    }

    if (sunrise.isNotEmpty) {
      map[DailyParameters.sunrise.value] = jsonEncode(sunrise);
    }

    if (sunset.isNotEmpty) {
      map[DailyParameters.sunset.value] = jsonEncode(sunset);
    }

    if (uvIndexMax.isNotEmpty) {
      map[DailyParameters.uvIndexMax.value] = jsonEncode(uvIndexMax);
    }

    if (uvIndexClearSkyMax.isNotEmpty) {
      map[DailyParameters.uvIndexClearSkyMax.value] =
          jsonEncode(uvIndexClearSkyMax);
    }

    if (precipitationSum.isNotEmpty) {
      map[DailyParameters.precipitationSum.value] =
          jsonEncode(precipitationSum);
    }

    if (rainSum.isNotEmpty) {
      map[DailyParameters.rainSum.value] = jsonEncode(rainSum);
    }

    if (showersSum.isNotEmpty) {
      map[DailyParameters.showersSum.value] = jsonEncode(showersSum);
    }

    if (snowfallSum.isNotEmpty) {
      map[DailyParameters.snowfallSum.value] = jsonEncode(snowfallSum);
    }

    if (precipitationHours.isNotEmpty) {
      map[DailyParameters.precipitationHours.value] =
          jsonEncode(precipitationHours);
    }

    if (precipitationProbabilityMax.isNotEmpty) {
      map[DailyParameters.precipitationProbabilityMax.value] =
          jsonEncode(precipitationProbabilityMax);
    }

    if (windspeed10MMax.isNotEmpty) {
      map[DailyParameters.windspeed10MMax.value] = jsonEncode(windspeed10MMax);
    }

    if (windgusts10MMax.isNotEmpty) {
      map[DailyParameters.windgusts10MMax.value] = jsonEncode(windgusts10MMax);
    }

    if (winddirection10MDominant.isNotEmpty) {
      map[DailyParameters.winddirection10MDominant.value] =
          jsonEncode(winddirection10MDominant);
    }

    if (shortwaveRadiationSum.isNotEmpty) {
      map[DailyParameters.shortwaveRadiationSum.value] =
          jsonEncode(shortwaveRadiationSum);
    }

    if (et0FaoEvapotranspiration.isNotEmpty) {
      map[DailyParameters.et0FaoEvapotranspiration.value] =
          jsonEncode(et0FaoEvapotranspiration);
    }

    return map;
  }
}
