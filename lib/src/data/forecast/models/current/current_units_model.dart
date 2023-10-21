import 'package:anemoi_weather/src/data/forecast/api_strings.dart';
import 'package:anemoi_weather/src/data/forecast/utils/enum_extensions.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/current_units.dart';
import 'package:anemoi_weather/src/domain/forecast/enums/enums.dart';

class CurrentUnitsModel extends CurrentUnits {
  CurrentUnitsModel({
    required super.time,
    required super.interval,
    super.temperature2M,
    super.relativehumidity2M,
    super.apparentTemperature,
    super.isDay,
    super.precipitation,
    super.rain,
    super.showers,
    super.snowfall,
    super.weathercode,
    super.cloudcover,
    super.pressureMsl,
    super.surfacePressure,
    super.windspeed10M,
    super.winddirection10M,
    super.windgusts10M,
  });

  CurrentUnitsModel.fromDomain(CurrentUnits currentUnits)
      : this(
          interval: currentUnits.interval,
          time: currentUnits.time,
          apparentTemperature: currentUnits.apparentTemperature,
          cloudcover: currentUnits.cloudcover,
          isDay: currentUnits.isDay,
          precipitation: currentUnits.precipitation,
          pressureMsl: currentUnits.pressureMsl,
          rain: currentUnits.rain,
          relativehumidity2M: currentUnits.relativehumidity2M,
          showers: currentUnits.showers,
          snowfall: currentUnits.snowfall,
          surfacePressure: currentUnits.surfacePressure,
          temperature2M: currentUnits.temperature2M,
          weathercode: currentUnits.weathercode,
          winddirection10M: currentUnits.winddirection10M,
          windgusts10M: currentUnits.windgusts10M,
          windspeed10M: currentUnits.windspeed10M,
        );

  factory CurrentUnitsModel.fromJson(DataMap json) {
    return CurrentUnitsModel(
      time: json[ApiStrings.time].toString(),
      interval: json[ApiStrings.interval].toString(),
      temperature2M: json.containsKey(CurrentParameters.temperature2M.value)
          ? json[CurrentParameters.temperature2M.value].toString()
          : null,
      relativehumidity2M:
          json.containsKey(CurrentParameters.relativehumidity2M.value)
              ? json[CurrentParameters.relativehumidity2M.value].toString()
              : null,
      apparentTemperature:
          json.containsKey(CurrentParameters.apparentTemperature.value)
              ? json[CurrentParameters.apparentTemperature.value].toString()
              : null,
      isDay: json.containsKey(CurrentParameters.isDay.value)
          ? json[CurrentParameters.isDay.value].toString()
          : null,
      precipitation: json.containsKey(CurrentParameters.precipitation.value)
          ? json[CurrentParameters.precipitation.value].toString()
          : null,
      rain: json.containsKey(CurrentParameters.rain.value)
          ? json[CurrentParameters.rain.value].toString()
          : null,
      showers: json.containsKey(CurrentParameters.showers.value)
          ? json[CurrentParameters.showers.value].toString()
          : null,
      snowfall: json.containsKey(CurrentParameters.snowfall.value)
          ? json[CurrentParameters.snowfall.value].toString()
          : null,
      weathercode: json.containsKey(CurrentParameters.weathercode.value)
          ? json[CurrentParameters.weathercode.value].toString()
          : null,
      cloudcover: json.containsKey(CurrentParameters.cloudcover.value)
          ? json[CurrentParameters.cloudcover.value].toString()
          : null,
      pressureMsl: json.containsKey(CurrentParameters.pressureMsl.value)
          ? json[CurrentParameters.pressureMsl.value].toString()
          : null,
      surfacePressure: json.containsKey(CurrentParameters.surfacePressure.value)
          ? json[CurrentParameters.surfacePressure.value].toString()
          : null,
      windspeed10M: json.containsKey(CurrentParameters.windspeed10M.value)
          ? json[CurrentParameters.windspeed10M.value].toString()
          : null,
      winddirection10M:
          json.containsKey(CurrentParameters.winddirection10M.value)
              ? json[CurrentParameters.winddirection10M.value].toString()
              : null,
      windgusts10M: json.containsKey(CurrentParameters.windgusts10M.value)
          ? json[CurrentParameters.windgusts10M.value].toString()
          : null,
    );
  }

  DataMap toJson() {
    final map = <String, dynamic>{
      ApiStrings.time: time,
      ApiStrings.interval: interval,
    };

    if (temperature2M != null) {
      map[CurrentParameters.temperature2M.value] = temperature2M;
    }

    if (relativehumidity2M != null) {
      map[CurrentParameters.relativehumidity2M.value] = relativehumidity2M;
    }

    if (apparentTemperature != null) {
      map[CurrentParameters.apparentTemperature.value] = apparentTemperature;
    }

    if (isDay != null) {
      map[CurrentParameters.isDay.value] = isDay;
    }

    if (precipitation != null) {
      map[CurrentParameters.precipitation.value] = precipitation;
    }

    if (rain != null) {
      map[CurrentParameters.rain.value] = rain;
    }

    if (showers != null) {
      map[CurrentParameters.showers.value] = showers;
    }

    if (snowfall != null) {
      map[CurrentParameters.snowfall.value] = snowfall;
    }

    if (weathercode != null) {
      map[CurrentParameters.weathercode.value] = weathercode;
    }

    if (cloudcover != null) {
      map[CurrentParameters.cloudcover.value] = cloudcover;
    }

    if (pressureMsl != null) {
      map[CurrentParameters.pressureMsl.value] = pressureMsl;
    }

    if (surfacePressure != null) {
      map[CurrentParameters.surfacePressure.value] = surfacePressure;
    }

    if (windspeed10M != null) {
      map[CurrentParameters.windspeed10M.value] = windspeed10M;
    }

    if (winddirection10M != null) {
      map[CurrentParameters.winddirection10M.value] = winddirection10M;
    }

    if (windgusts10M != null) {
      map[CurrentParameters.windgusts10M.value] = windgusts10M;
    }

    return map;
  }
}
