import 'package:anemoi_weather/src/forecast/data/api_strings.dart';
import 'package:anemoi_weather/src/forecast/domain/enums/enums.dart' as domain;

extension CurrentParametersExtension on domain.CurrentParameters {
  String get value {
    switch (this) {
      case domain.CurrentParameters.temperature2M:
        return ApiStrings.temperature2M;
      case domain.CurrentParameters.relativehumidity2M:
        return ApiStrings.relativehumidity2M;
      case domain.CurrentParameters.apparentTemperature:
        return ApiStrings.apparentTemperature;
      case domain.CurrentParameters.isDay:
        return ApiStrings.isDay;
      case domain.CurrentParameters.precipitation:
        return ApiStrings.precipitation;
      case domain.CurrentParameters.rain:
        return ApiStrings.rain;
      case domain.CurrentParameters.showers:
        return ApiStrings.showers;
      case domain.CurrentParameters.snowfall:
        return ApiStrings.snowfall;
      case domain.CurrentParameters.weathercode:
        return ApiStrings.weathercode;
      case domain.CurrentParameters.cloudcover:
        return ApiStrings.cloudcover;
      case domain.CurrentParameters.pressureMsl:
        return ApiStrings.pressureMsl;
      case domain.CurrentParameters.surfacePressure:
        return ApiStrings.surfacePressure;
      case domain.CurrentParameters.windspeed10M:
        return ApiStrings.windspeed10M;
      case domain.CurrentParameters.winddirection10M:
        return ApiStrings.winddirection10M;
      case domain.CurrentParameters.windgusts10M:
        return ApiStrings.windgusts10M;
    }
  }
}

extension HourlyParametersExtension on domain.HourlyParameters {
  String get value {
    switch (this) {
      case domain.HourlyParameters.temperature2M:
        return ApiStrings.temperature2M;
      case domain.HourlyParameters.relativehumidity2M:
        return ApiStrings.relativehumidity2M;
      case domain.HourlyParameters.dewpoint2M:
        return ApiStrings.dewpoint2M;
      case domain.HourlyParameters.apparentTemperature:
        return ApiStrings.apparentTemperature;
      case domain.HourlyParameters.precipitationProbability:
        return ApiStrings.precipitationProbability;
      case domain.HourlyParameters.precipitation:
        return ApiStrings.precipitation;
      case domain.HourlyParameters.rain:
        return ApiStrings.rain;
      case domain.HourlyParameters.showers:
        return ApiStrings.showers;
      case domain.HourlyParameters.snowfall:
        return ApiStrings.snowfall;
      case domain.HourlyParameters.snowDepth:
        return ApiStrings.snowDepth;
      case domain.HourlyParameters.weathercode:
        return ApiStrings.weathercode;
      case domain.HourlyParameters.pressureMsl:
        return ApiStrings.pressureMsl;
      case domain.HourlyParameters.surfacePressure:
        return ApiStrings.surfacePressure;
      case domain.HourlyParameters.cloudcover:
        return ApiStrings.cloudcover;
      case domain.HourlyParameters.cloudcoverLow:
        return ApiStrings.cloudcoverLow;
      case domain.HourlyParameters.cloudcoverMid:
        return ApiStrings.cloudcoverMid;
      case domain.HourlyParameters.cloudcoverHigh:
        return ApiStrings.cloudcoverHigh;
      case domain.HourlyParameters.visibility:
        return ApiStrings.visibility;
      case domain.HourlyParameters.evapotranspiration:
        return ApiStrings.evapotranspiration;
      case domain.HourlyParameters.et0FaoEvapotranspiration:
        return ApiStrings.et0FaoEvapotranspiration;
      case domain.HourlyParameters.vaporPressureDeficit:
        return ApiStrings.vaporPressureDeficit;
      case domain.HourlyParameters.windspeed10M:
        return ApiStrings.windspeed10M;
      case domain.HourlyParameters.windspeed80M:
        return ApiStrings.windspeed80M;
      case domain.HourlyParameters.windspeed120M:
        return ApiStrings.windspeed120M;
      case domain.HourlyParameters.windspeed180M:
        return ApiStrings.windspeed180M;
      case domain.HourlyParameters.winddirection10M:
        return ApiStrings.winddirection10M;
      case domain.HourlyParameters.winddirection80M:
        return ApiStrings.winddirection80M;
      case domain.HourlyParameters.winddirection120M:
        return ApiStrings.winddirection120M;
      case domain.HourlyParameters.winddirection180M:
        return ApiStrings.winddirection180M;
      case domain.HourlyParameters.windgusts10M:
        return ApiStrings.windgusts10M;
      case domain.HourlyParameters.temperature80M:
        return ApiStrings.temperature80M;
      case domain.HourlyParameters.temperature120M:
        return ApiStrings.temperature120M;
      case domain.HourlyParameters.temperature180M:
        return ApiStrings.temperature180M;
      case domain.HourlyParameters.soilTemperature0Cm:
        return ApiStrings.soilTemperature0Cm;
      case domain.HourlyParameters.soilTemperature6Cm:
        return ApiStrings.soilTemperature6Cm;
      case domain.HourlyParameters.soilTemperature18Cm:
        return ApiStrings.soilTemperature18Cm;
      case domain.HourlyParameters.soilTemperature54Cm:
        return ApiStrings.soilTemperature54Cm;
      case domain.HourlyParameters.soilMoisture0To1Cm:
        return ApiStrings.soilMoisture0To1Cm;
      case domain.HourlyParameters.soilMoisture1To3Cm:
        return ApiStrings.soilMoisture1To3Cm;
      case domain.HourlyParameters.soilMoisture3To9Cm:
        return ApiStrings.soilMoisture3To9Cm;
      case domain.HourlyParameters.soilMoisture9To27Cm:
        return ApiStrings.soilMoisture9To27Cm;
      case domain.HourlyParameters.soilMoisture27To81Cm:
        return ApiStrings.soilMoisture27To81Cm;
    }
  }
}

extension DailyParametersExtension on domain.DailyParameters {
  String get value {
    switch (this) {
      case domain.DailyParameters.temperature2MMax:
        return ApiStrings.temperature2MMax;
      case domain.DailyParameters.temperature2MMin:
        return ApiStrings.temperature2MMin;
      case domain.DailyParameters.apparentTemperatureMax:
        return ApiStrings.apparentTemperatureMax;
      case domain.DailyParameters.apparentTemperatureMin:
        return ApiStrings.apparentTemperatureMin;
      case domain.DailyParameters.sunrise:
        return ApiStrings.sunrise;
      case domain.DailyParameters.sunset:
        return ApiStrings.sunset;
      case domain.DailyParameters.uvIndexMax:
        return ApiStrings.uvIndexMax;
      case domain.DailyParameters.uvIndexClearSkyMax:
        return ApiStrings.uvIndexClearSkyMax;
      case domain.DailyParameters.precipitationSum:
        return ApiStrings.precipitationSum;
      case domain.DailyParameters.rainSum:
        return ApiStrings.rainSum;
      case domain.DailyParameters.showersSum:
        return ApiStrings.showersSum;
      case domain.DailyParameters.snowfallSum:
        return ApiStrings.snowfallSum;
      case domain.DailyParameters.precipitationHours:
        return ApiStrings.precipitationHours;
      case domain.DailyParameters.precipitationProbabilityMax:
        return ApiStrings.precipitationProbabilityMax;
      case domain.DailyParameters.windspeed10MMax:
        return ApiStrings.windspeed10MMax;
      case domain.DailyParameters.windgusts10MMax:
        return ApiStrings.windgusts10MMax;
      case domain.DailyParameters.winddirection10MDominant:
        return ApiStrings.winddirection10MDominant;
      case domain.DailyParameters.shortwaveRadiationSum:
        return ApiStrings.shortwaveRadiationSum;
      case domain.DailyParameters.et0FaoEvapotranspiration:
        return ApiStrings.et0FaoEvapotranspiration;
    }
  }
}
