import 'package:anemoi_weather/api/forecast/api_strings.dart';
import 'package:anemoi_weather/api/forecast/daily/enums.dart';

class DailyUnits {
  final String time;
  final String? weathercode;
  final String? temperature2MMax;
  final String? temperature2MMin;
  final String? apparentTemperatureMax;
  final String? apparentTemperatureMin;
  final String? sunrise;
  final String? sunset;
  final String? uvIndexMax;
  final String? uvIndexClearSkyMax;
  final String? precipitationSum;
  final String? rainSum;
  final String? showersSum;
  final String? snowfallSum;
  final String? precipitationHours;
  final String? precipitationProbabilityMax;
  final String? windspeed10MMax;
  final String? windgusts10MMax;
  final String? winddirection10MDominant;
  final String? shortwaveRadiationSum;
  final String? et0FaoEvapotranspiration;

  DailyUnits({
    required this.time,
    this.weathercode,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.apparentTemperatureMin,
    this.sunrise,
    this.sunset,
    this.uvIndexMax,
    this.uvIndexClearSkyMax,
    this.precipitationSum,
    this.rainSum,
    this.showersSum,
    this.snowfallSum,
    this.precipitationHours,
    this.precipitationProbabilityMax,
    this.windspeed10MMax,
    this.windgusts10MMax,
    this.winddirection10MDominant,
    this.shortwaveRadiationSum,
    this.et0FaoEvapotranspiration,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json[ApiStrings.time] as String,
      temperature2MMax: json.containsKey(DailyParameters.temperature2MMax.value)
          ? json[DailyParameters.temperature2MMax.value] as String
          : null,
      temperature2MMin: json.containsKey(DailyParameters.temperature2MMin.value)
          ? json[DailyParameters.temperature2MMin.value] as String
          : null,
      apparentTemperatureMax:
          json.containsKey(DailyParameters.apparentTemperatureMax.value)
              ? json[DailyParameters.apparentTemperatureMax.value] as String
              : null,
      apparentTemperatureMin:
          json.containsKey(DailyParameters.apparentTemperatureMin.value)
              ? json[DailyParameters.apparentTemperatureMin.value] as String
              : null,
      sunrise: json.containsKey(DailyParameters.sunrise.value)
          ? json[DailyParameters.sunrise.value] as String
          : null,
      sunset: json.containsKey(DailyParameters.sunset.value)
          ? json[DailyParameters.sunset.value] as String
          : null,
      uvIndexMax: json.containsKey(DailyParameters.uvIndexMax.value)
          ? json[DailyParameters.uvIndexMax.value] as String
          : null,
      uvIndexClearSkyMax:
          json.containsKey(DailyParameters.uvIndexClearSkyMax.value)
              ? json[DailyParameters.uvIndexClearSkyMax.value] as String
              : null,
      precipitationSum: json.containsKey(DailyParameters.precipitationSum.value)
          ? json[DailyParameters.precipitationSum.value] as String
          : null,
      rainSum: json.containsKey(DailyParameters.rainSum.value)
          ? json[DailyParameters.rainSum.value] as String
          : null,
      showersSum: json.containsKey(DailyParameters.showersSum.value)
          ? json[DailyParameters.showersSum.value] as String
          : null,
      snowfallSum: json.containsKey(DailyParameters.snowfallSum.value)
          ? json[DailyParameters.snowfallSum.value] as String
          : null,
      precipitationHours:
          json.containsKey(DailyParameters.precipitationHours.value)
              ? json[DailyParameters.precipitationHours.value] as String
              : null,
      precipitationProbabilityMax: json
              .containsKey(DailyParameters.precipitationProbabilityMax.value)
          ? json[DailyParameters.precipitationProbabilityMax.value] as String
          : null,
      windspeed10MMax: json.containsKey(DailyParameters.windgusts10MMax.value)
          ? json[DailyParameters.windgusts10MMax.value] as String
          : null,
      windgusts10MMax: json.containsKey(DailyParameters.windgusts10MMax.value)
          ? json[DailyParameters.windgusts10MMax.value] as String
          : null,
      winddirection10MDominant:
          json.containsKey(DailyParameters.winddirection10MDominant.value)
              ? json[DailyParameters.winddirection10MDominant.value] as String
              : null,
      shortwaveRadiationSum:
          json.containsKey(DailyParameters.shortwaveRadiationSum.value)
              ? json[DailyParameters.shortwaveRadiationSum.value] as String
              : null,
      et0FaoEvapotranspiration:
          json.containsKey(DailyParameters.et0FaoEvapotranspiration.value)
              ? json[DailyParameters.et0FaoEvapotranspiration.value] as String
              : null,
    );
  }

  Map<String, dynamic> toJson() {
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
