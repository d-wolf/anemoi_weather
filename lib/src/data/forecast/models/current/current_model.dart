import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/data/forecast/api_strings.dart';
import 'package:anemoi_weather/src/data/forecast/utils/enum_extensions.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/current.dart';
import 'package:anemoi_weather/src/domain/forecast/enums/enums.dart';

class CurrentModel extends Current {
  CurrentModel({
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

  CurrentModel.fromDomain(Current current)
      : this(
          time: current.time,
          interval: current.interval,
          apparentTemperature: current.apparentTemperature,
          isDay: current.isDay,
          cloudcover: current.cloudcover,
          precipitation: current.precipitation,
          pressureMsl: current.apparentTemperature,
          rain: current.rain,
          relativehumidity2M: current.relativehumidity2M,
          showers: current.showers,
          snowfall: current.snowfall,
          surfacePressure: current.surfacePressure,
          temperature2M: current.temperature2M,
          weathercode: current.weathercode,
          winddirection10M: current.winddirection10M,
          windgusts10M: current.windgusts10M,
          windspeed10M: current.windspeed10M,
        );

  factory CurrentModel.fromJson(DataMap json) {
    return CurrentModel(
      time: DateTime.fromMillisecondsSinceEpoch(
          (json[ApiStrings.time] as int) * 1000,
          isUtc: true),
      interval: json[ApiStrings.interval] as int,
      temperature2M: json.containsKey(CurrentParameters.temperature2M.value)
          ? json[CurrentParameters.temperature2M.value] as double
          : null,
      relativehumidity2M:
          json.containsKey(CurrentParameters.relativehumidity2M.value)
              ? json[CurrentParameters.relativehumidity2M.value] as int
              : null,
      apparentTemperature:
          json.containsKey(CurrentParameters.apparentTemperature.value)
              ? json[CurrentParameters.apparentTemperature.value] as double
              : null,
      isDay: json.containsKey(CurrentParameters.isDay.value)
          ? (json[CurrentParameters.isDay.value] as int) == 1
          : null,
      precipitation: json.containsKey(CurrentParameters.precipitation.value)
          ? json[CurrentParameters.precipitation.value] as double
          : null,
      rain: json.containsKey(CurrentParameters.rain.value)
          ? json[CurrentParameters.rain.value] as int
          : null,
      showers: json.containsKey(CurrentParameters.showers.value)
          ? json[CurrentParameters.showers.value] as int
          : null,
      snowfall: json.containsKey(CurrentParameters.snowfall.value)
          ? json[CurrentParameters.snowfall.value] as int
          : null,
      weathercode: json.containsKey(CurrentParameters.weathercode.value)
          ? json[CurrentParameters.weathercode.value] as int
          : null,
      cloudcover: json.containsKey(CurrentParameters.cloudcover.value)
          ? json[CurrentParameters.cloudcover.value] as int
          : null,
      pressureMsl: json.containsKey(CurrentParameters.pressureMsl.value)
          ? json[CurrentParameters.pressureMsl.value] as double
          : null,
      surfacePressure: json.containsKey(CurrentParameters.surfacePressure.value)
          ? json[CurrentParameters.surfacePressure.value] as double
          : null,
      windspeed10M: json.containsKey(CurrentParameters.windspeed10M.value)
          ? json[CurrentParameters.windspeed10M.value] as double
          : null,
      winddirection10M:
          json.containsKey(CurrentParameters.winddirection10M.value)
              ? json[CurrentParameters.winddirection10M.value] as int
              : null,
      windgusts10M: json.containsKey(CurrentParameters.windgusts10M.value)
          ? json[CurrentParameters.windgusts10M.value] as int
          : null,
    );
  }

  DataMap toJson() {
    final map = <String, dynamic>{
      ApiStrings.time: time.millisecondsSinceEpoch ~/ 1000,
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
      map[CurrentParameters.isDay.value] = isDay! ? 1 : 0;
    }

    if (precipitation != null) {
      map[CurrentParameters.precipitation.value] = precipitation;
    }

    if (rain != null) {
      map[CurrentParameters.rain.value] = rain;
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
