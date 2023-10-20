import 'dart:convert';

import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
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
      time: (json[ApiStrings.time] as List)
          .cast<int>()
          .map(
            (e) => DateTime.fromMillisecondsSinceEpoch(e * 1000, isUtc: true),
          )
          .toList(),
      temperature2MMax: json.containsKey(DailyParameters.temperature2MMax.value)
          ? (json[DailyParameters.temperature2MMax.value] as List)
              .cast<double>()
          : [],
      temperature2MMin: json.containsKey(DailyParameters.temperature2MMin.value)
          ? (json[DailyParameters.temperature2MMin.value] as List)
              .cast<double>()
          : [],
      apparentTemperatureMax:
          json.containsKey(DailyParameters.apparentTemperatureMax.value)
              ? (json[DailyParameters.apparentTemperatureMax.value] as List)
                  .cast<double>()
              : [],
      apparentTemperatureMin:
          json.containsKey(DailyParameters.apparentTemperatureMin.value)
              ? (json[DailyParameters.apparentTemperatureMin.value] as List)
                  .cast<double>()
              : [],
      sunrise: json.containsKey(DailyParameters.sunrise.value)
          ? (json[DailyParameters.sunrise.value] as List).cast<String>()
          : [],
      sunset: json.containsKey(DailyParameters.sunset.value)
          ? (json[DailyParameters.sunset.value] as List).cast<String>()
          : [],
      uvIndexMax: json.containsKey(DailyParameters.uvIndexMax.value)
          ? (json[DailyParameters.uvIndexMax.value] as List).cast<double>()
          : [],
      uvIndexClearSkyMax:
          json.containsKey(DailyParameters.uvIndexClearSkyMax.value)
              ? (json[DailyParameters.uvIndexClearSkyMax.value] as List)
                  .cast<double>()
              : [],
      precipitationSum: json.containsKey(DailyParameters.precipitationSum.value)
          ? (json[DailyParameters.precipitationSum.value] as List)
              .cast<double>()
          : [],
      rainSum: json.containsKey(DailyParameters.rainSum.value)
          ? (json[DailyParameters.rainSum.value] as List).cast<double>()
          : [],
      showersSum: json.containsKey(DailyParameters.showersSum.value)
          ? (json[DailyParameters.showersSum.value] as List).cast<int>()
          : [],
      snowfallSum: json.containsKey(DailyParameters.snowfallSum.value)
          ? (json[DailyParameters.snowfallSum.value] as List).cast<double>()
          : [],
      precipitationHours: json
              .containsKey(DailyParameters.precipitationHours.value)
          ? (json[DailyParameters.precipitationHours.value] as List).cast<int>()
          : [],
      precipitationProbabilityMax: json
              .containsKey(DailyParameters.precipitationProbabilityMax.value)
          ? (json[DailyParameters.precipitationProbabilityMax.value] as List)
              .cast<int>()
          : [],
      windspeed10MMax: json.containsKey(DailyParameters.windspeed10MMax.value)
          ? (json[DailyParameters.windspeed10MMax.value] as List).cast<double>()
          : [],
      windgusts10MMax: json.containsKey(DailyParameters.windgusts10MMax.value)
          ? (json[DailyParameters.windgusts10MMax.value] as List).cast<double>()
          : [],
      winddirection10MDominant:
          json.containsKey(DailyParameters.winddirection10MDominant.value)
              ? (json[DailyParameters.winddirection10MDominant.value] as List)
                  .cast<int>()
              : [],
      shortwaveRadiationSum:
          json.containsKey(DailyParameters.shortwaveRadiationSum.value)
              ? (json[DailyParameters.shortwaveRadiationSum.value] as List)
                  .cast<double>()
              : [],
      et0FaoEvapotranspiration:
          json.containsKey(DailyParameters.et0FaoEvapotranspiration.value)
              ? (json[DailyParameters.et0FaoEvapotranspiration.value] as List)
                  .cast<double>()
              : [],
    );
  }

  DataMap toJson() {
    final map = <String, dynamic>{
      ApiStrings.time: jsonEncode(
        time.map((e) => e.millisecondsSinceEpoch ~/ 1000).toList(),
      ),
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
