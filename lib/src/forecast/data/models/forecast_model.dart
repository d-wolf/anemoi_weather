import 'package:anemoi_weather/src/forecast/data/api_strings.dart';
import 'package:anemoi_weather/src/forecast/data/models/current/current_model.dart';
import 'package:anemoi_weather/src/forecast/data/models/current/current_units_model.dart';
import 'package:anemoi_weather/src/forecast/data/models/daily/daily_model.dart';
import 'package:anemoi_weather/src/forecast/data/models/daily/daily_units_model.dart';
import 'package:anemoi_weather/src/forecast/data/models/hourly/hourly_model.dart';
import 'package:anemoi_weather/src/forecast/data/models/hourly/hourly_units_model.dart';
import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';

class ForecastModel extends Forecast {
  ForecastModel({
    required super.latitude,
    required super.longitude,
    required super.generationtimeMs,
    required super.utcOffsetSeconds,
    required super.timezone,
    required super.timezoneAbbreviation,
    required super.elevation,
    super.currentUnits,
    super.current,
    super.hourlyUnits,
    super.hourly,
    super.dailyUnits,
    super.daily,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      latitude: json[ApiStrings.latitude] as double,
      longitude: json[ApiStrings.longitude] as double,
      generationtimeMs: json[ApiStrings.generationtimeMs] as double,
      utcOffsetSeconds: json[ApiStrings.utcOffsetSeconds] as int,
      timezone: json[ApiStrings.timezone] as String,
      timezoneAbbreviation: json[ApiStrings.timezoneAbbreviation] as String,
      elevation: json[ApiStrings.elevation] as double,
      currentUnits: json.containsKey(ApiStrings.currentUnits)
          ? CurrentUnitsModel.fromJson(json[ApiStrings.currentUnits])
          : null,
      current: json.containsKey(ApiStrings.current)
          ? CurrentModel.fromJson(json[ApiStrings.current])
          : null,
      hourlyUnits: json.containsKey(ApiStrings.hourlyUnits)
          ? HourlyUnitsModel.fromJson(json[ApiStrings.hourlyUnits])
          : null,
      hourly: json.containsKey(ApiStrings.hourly)
          ? HourlyModel.fromJson(json[ApiStrings.hourly])
          : null,
      dailyUnits: json.containsKey(ApiStrings.dailyUnits)
          ? DailyUnitsModel.fromJson(json[ApiStrings.dailyUnits])
          : null,
      daily: json.containsKey(ApiStrings.daily)
          ? DailyModel.fromJson(json[ApiStrings.daily])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      ApiStrings.latitude: latitude,
      ApiStrings.longitude: longitude,
      ApiStrings.generationtimeMs: generationtimeMs,
      ApiStrings.utcOffsetSeconds: utcOffsetSeconds,
      ApiStrings.timezone: timezone,
      ApiStrings.timezoneAbbreviation: timezoneAbbreviation,
      ApiStrings.elevation: elevation,
    };

    if (currentUnits != null) {
      map[ApiStrings.currentUnits] =
          CurrentUnitsModel.fromDomain(currentUnits!).toJson();
    }

    if (current != null) {
      map[ApiStrings.current] = CurrentModel.fromDomain(current!).toJson();
    }

    if (hourlyUnits != null) {
      map[ApiStrings.hourlyUnits] =
          HourlyUnitsModel.fromDomain(hourlyUnits!).toJson();
    }

    if (hourly != null) {
      map[ApiStrings.hourly] = HourlyModel.fromDomain(hourly!).toJson();
    }

    if (dailyUnits != null) {
      map[ApiStrings.dailyUnits] =
          DailyUnitsModel.fromDomain(dailyUnits!).toJson();
    }

    if (hourly != null) {
      map[ApiStrings.daily] = DailyModel.fromDomain(daily!).toJson();
    }

    return map;
  }
}
