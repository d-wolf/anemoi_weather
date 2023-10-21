import 'package:anemoi_weather/src/data/forecast/api_strings.dart';
import 'package:anemoi_weather/src/data/forecast/utils/enum_extensions.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/daily_units.dart';
import 'package:anemoi_weather/src/domain/forecast/enums/enums.dart';

class DailyUnitsModel extends DailyUnits {
  DailyUnitsModel({
    required super.time,
    super.weathercode,
    super.temperature2MMax,
    super.temperature2MMin,
    super.apparentTemperatureMax,
    super.apparentTemperatureMin,
    super.sunrise,
    super.sunset,
    super.uvIndexMax,
    super.uvIndexClearSkyMax,
    super.precipitationSum,
    super.rainSum,
    super.showersSum,
    super.snowfallSum,
    super.precipitationHours,
    super.precipitationProbabilityMax,
    super.windspeed10MMax,
    super.windgusts10MMax,
    super.winddirection10MDominant,
    super.shortwaveRadiationSum,
    super.et0FaoEvapotranspiration,
  });

  DailyUnitsModel.fromDomain(DailyUnits dailyUnits)
      : this(
          time: dailyUnits.time,
          apparentTemperatureMax: dailyUnits.apparentTemperatureMax,
          apparentTemperatureMin: dailyUnits.apparentTemperatureMin,
          et0FaoEvapotranspiration: dailyUnits.et0FaoEvapotranspiration,
          precipitationHours: dailyUnits.precipitationHours,
          precipitationProbabilityMax: dailyUnits.precipitationProbabilityMax,
          precipitationSum: dailyUnits.precipitationSum,
          rainSum: dailyUnits.rainSum,
          shortwaveRadiationSum: dailyUnits.shortwaveRadiationSum,
          showersSum: dailyUnits.showersSum,
          snowfallSum: dailyUnits.snowfallSum,
          sunrise: dailyUnits.sunrise,
          sunset: dailyUnits.sunset,
          temperature2MMax: dailyUnits.temperature2MMax,
          temperature2MMin: dailyUnits.temperature2MMin,
          uvIndexClearSkyMax: dailyUnits.uvIndexClearSkyMax,
          uvIndexMax: dailyUnits.uvIndexMax,
          weathercode: dailyUnits.weathercode,
          winddirection10MDominant: dailyUnits.winddirection10MDominant,
          windgusts10MMax: dailyUnits.windgusts10MMax,
          windspeed10MMax: dailyUnits.windspeed10MMax,
        );

  factory DailyUnitsModel.fromJson(DataMap json) {
    return DailyUnitsModel(
      time: json[ApiStrings.time].toString(),
      temperature2MMax: json.containsKey(DailyParameters.temperature2MMax.value)
          ? json[DailyParameters.temperature2MMax.value].toString()
          : null,
      temperature2MMin: json.containsKey(DailyParameters.temperature2MMin.value)
          ? json[DailyParameters.temperature2MMin.value].toString()
          : null,
      apparentTemperatureMax:
          json.containsKey(DailyParameters.apparentTemperatureMax.value)
              ? json[DailyParameters.apparentTemperatureMax.value].toString()
              : null,
      apparentTemperatureMin:
          json.containsKey(DailyParameters.apparentTemperatureMin.value)
              ? json[DailyParameters.apparentTemperatureMin.value].toString()
              : null,
      sunrise: json.containsKey(DailyParameters.sunrise.value)
          ? json[DailyParameters.sunrise.value].toString()
          : null,
      sunset: json.containsKey(DailyParameters.sunset.value)
          ? json[DailyParameters.sunset.value].toString()
          : null,
      uvIndexMax: json.containsKey(DailyParameters.uvIndexMax.value)
          ? json[DailyParameters.uvIndexMax.value].toString()
          : null,
      uvIndexClearSkyMax:
          json.containsKey(DailyParameters.uvIndexClearSkyMax.value)
              ? json[DailyParameters.uvIndexClearSkyMax.value].toString()
              : null,
      precipitationSum: json.containsKey(DailyParameters.precipitationSum.value)
          ? json[DailyParameters.precipitationSum.value].toString()
          : null,
      rainSum: json.containsKey(DailyParameters.rainSum.value)
          ? json[DailyParameters.rainSum.value].toString()
          : null,
      showersSum: json.containsKey(DailyParameters.showersSum.value)
          ? json[DailyParameters.showersSum.value].toString()
          : null,
      snowfallSum: json.containsKey(DailyParameters.snowfallSum.value)
          ? json[DailyParameters.snowfallSum.value].toString()
          : null,
      precipitationHours:
          json.containsKey(DailyParameters.precipitationHours.value)
              ? json[DailyParameters.precipitationHours.value].toString()
              : null,
      precipitationProbabilityMax: json
              .containsKey(DailyParameters.precipitationProbabilityMax.value)
          ? json[DailyParameters.precipitationProbabilityMax.value].toString()
          : null,
      windspeed10MMax: json.containsKey(DailyParameters.windgusts10MMax.value)
          ? json[DailyParameters.windgusts10MMax.value].toString()
          : null,
      windgusts10MMax: json.containsKey(DailyParameters.windgusts10MMax.value)
          ? json[DailyParameters.windgusts10MMax.value].toString()
          : null,
      winddirection10MDominant:
          json.containsKey(DailyParameters.winddirection10MDominant.value)
              ? json[DailyParameters.winddirection10MDominant.value].toString()
              : null,
      shortwaveRadiationSum:
          json.containsKey(DailyParameters.shortwaveRadiationSum.value)
              ? json[DailyParameters.shortwaveRadiationSum.value].toString()
              : null,
      et0FaoEvapotranspiration:
          json.containsKey(DailyParameters.et0FaoEvapotranspiration.value)
              ? json[DailyParameters.et0FaoEvapotranspiration.value].toString()
              : null,
    );
  }

  DataMap toJson() {
    final map = <String, dynamic>{
      ApiStrings.time: time,
    };

    if (temperature2MMax != null) {
      map[DailyParameters.temperature2MMax.value] = temperature2MMax;
    }

    if (temperature2MMin != null) {
      map[DailyParameters.temperature2MMin.value] = temperature2MMin;
    }

    if (apparentTemperatureMax != null) {
      map[DailyParameters.apparentTemperatureMax.value] =
          apparentTemperatureMax;
    }

    if (apparentTemperatureMin != null) {
      map[DailyParameters.apparentTemperatureMin.value] =
          apparentTemperatureMin;
    }

    if (sunrise != null) {
      map[DailyParameters.sunrise.value] = sunrise;
    }

    if (sunset != null) {
      map[DailyParameters.sunset.value] = sunset;
    }

    if (uvIndexMax != null) {
      map[DailyParameters.uvIndexMax.value] = uvIndexMax;
    }

    if (uvIndexClearSkyMax != null) {
      map[DailyParameters.uvIndexClearSkyMax.value] = uvIndexClearSkyMax;
    }

    if (precipitationSum != null) {
      map[DailyParameters.precipitationSum.value] = precipitationSum;
    }

    if (rainSum != null) {
      map[DailyParameters.rainSum.value] = rainSum;
    }

    if (showersSum != null) {
      map[DailyParameters.showersSum.value] = showersSum;
    }

    if (snowfallSum != null) {
      map[DailyParameters.snowfallSum.value] = snowfallSum;
    }

    if (precipitationHours != null) {
      map[DailyParameters.precipitationHours.value] = precipitationHours;
    }

    if (precipitationProbabilityMax != null) {
      map[DailyParameters.precipitationProbabilityMax.value] =
          precipitationProbabilityMax;
    }

    if (windspeed10MMax != null) {
      map[DailyParameters.windspeed10MMax.value] = windspeed10MMax;
    }

    if (windgusts10MMax != null) {
      map[DailyParameters.windspeed10MMax.value] = windgusts10MMax;
    }

    if (winddirection10MDominant != null) {
      map[DailyParameters.winddirection10MDominant.value] =
          winddirection10MDominant;
    }

    if (shortwaveRadiationSum != null) {
      map[DailyParameters.shortwaveRadiationSum.value] = shortwaveRadiationSum;
    }

    if (et0FaoEvapotranspiration != null) {
      map[DailyParameters.et0FaoEvapotranspiration.value] =
          et0FaoEvapotranspiration;
    }

    return map;
  }
}
