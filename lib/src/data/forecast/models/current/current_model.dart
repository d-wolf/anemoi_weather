import 'package:anemoi_weather/src/data/forecast/api_strings.dart';
import 'package:anemoi_weather/src/data/forecast/utils/enum_extensions.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
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
        (int.parse(json[ApiStrings.time].toString())) * 1000,
        isUtc: true,
      ),
      interval: int.parse(json[ApiStrings.interval].toString()),
      temperature2M: json.containsKey(CurrentParameters.temperature2M.value)
          ? double.parse(json[CurrentParameters.temperature2M.value].toString())
          : null,
      relativehumidity2M:
          json.containsKey(CurrentParameters.relativehumidity2M.value)
              ? int.parse(
                  json[CurrentParameters.relativehumidity2M.value].toString(),
                )
              : null,
      apparentTemperature:
          json.containsKey(CurrentParameters.apparentTemperature.value)
              ? double.parse(
                  json[CurrentParameters.apparentTemperature.value].toString(),
                )
              : null,
      isDay: json.containsKey(CurrentParameters.isDay.value)
          ? (int.parse(json[CurrentParameters.isDay.value].toString())) == 1
          : null,
      precipitation: json.containsKey(CurrentParameters.precipitation.value)
          ? double.parse(json[CurrentParameters.precipitation.value].toString())
          : null,
      rain: json.containsKey(CurrentParameters.rain.value)
          ? double.parse(json[CurrentParameters.rain.value].toString())
          : null,
      showers: json.containsKey(CurrentParameters.showers.value)
          ? int.parse(json[CurrentParameters.showers.value].toString())
          : null,
      snowfall: json.containsKey(CurrentParameters.snowfall.value)
          ? int.parse(json[CurrentParameters.snowfall.value].toString())
          : null,
      weathercode: json.containsKey(CurrentParameters.weathercode.value)
          ? int.parse(json[CurrentParameters.weathercode.value].toString())
          : null,
      cloudcover: json.containsKey(CurrentParameters.cloudcover.value)
          ? int.parse(json[CurrentParameters.cloudcover.value].toString())
          : null,
      pressureMsl: json.containsKey(CurrentParameters.pressureMsl.value)
          ? double.parse(json[CurrentParameters.pressureMsl.value].toString())
          : null,
      surfacePressure: json.containsKey(CurrentParameters.surfacePressure.value)
          ? double.parse(
              json[CurrentParameters.surfacePressure.value].toString(),
            )
          : null,
      windspeed10M: json.containsKey(CurrentParameters.windspeed10M.value)
          ? double.parse(json[CurrentParameters.windspeed10M.value].toString())
          : null,
      winddirection10M: json
              .containsKey(CurrentParameters.winddirection10M.value)
          ? int.parse(json[CurrentParameters.winddirection10M.value].toString())
          : null,
      windgusts10M: json.containsKey(CurrentParameters.windgusts10M.value)
          ? int.parse(json[CurrentParameters.windgusts10M.value].toString())
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
