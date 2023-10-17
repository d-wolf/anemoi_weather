import 'package:anemoi_weather/api/forecast/api_strings.dart';
import 'package:anemoi_weather/api/forecast/current/current.dart';
import 'package:anemoi_weather/api/forecast/current/current_units.dart';
import 'package:anemoi_weather/api/forecast/daily/daily.dart';
import 'package:anemoi_weather/api/forecast/daily/daily_units.dart';
import 'package:anemoi_weather/api/forecast/hourly/hourly.dart';
import 'package:anemoi_weather/api/forecast/hourly/hourly_units.dart';

class Forecast {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits? currentUnits;
  final Current? current;
  final HourlyUnits? hourlyUnits;
  final Hourly? hourly;
  final DailyUnits? dailyUnits;
  final Daily? daily;

  Forecast({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    this.currentUnits,
    this.current,
    this.hourlyUnits,
    this.hourly,
    this.dailyUnits,
    this.daily,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      latitude: json[ApiStrings.latitude] as double,
      longitude: json[ApiStrings.longitude] as double,
      generationtimeMs: json[ApiStrings.generationtimeMs] as double,
      utcOffsetSeconds: json[ApiStrings.utcOffsetSeconds] as int,
      timezone: json[ApiStrings.timezone] as String,
      timezoneAbbreviation: json[ApiStrings.timezoneAbbreviation] as String,
      elevation: json[ApiStrings.elevation] as double,
      currentUnits: json.containsKey(ApiStrings.currentUnits)
          ? CurrentUnits.fromJson(json[ApiStrings.currentUnits])
          : null,
      current: json.containsKey(ApiStrings.current)
          ? Current.fromJson(json[ApiStrings.current])
          : null,
      hourlyUnits: json.containsKey(ApiStrings.hourlyUnits)
          ? HourlyUnits.fromJson(json[ApiStrings.hourlyUnits])
          : null,
      hourly: json.containsKey(ApiStrings.hourly)
          ? Hourly.fromJson(json[ApiStrings.hourly])
          : null,
      dailyUnits: json.containsKey(ApiStrings.dailyUnits)
          ? DailyUnits.fromJson(json[ApiStrings.dailyUnits])
          : null,
      daily: json.containsKey(ApiStrings.daily)
          ? Daily.fromJson(json[ApiStrings.daily])
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
      map[ApiStrings.currentUnits] = currentUnits!.toJson();
    }

    if (current != null) {
      map[ApiStrings.current] = current!.toJson();
    }

    if (hourlyUnits != null) {
      map[ApiStrings.hourlyUnits] = hourlyUnits!.toJson();
    }

    if (hourly != null) {
      map[ApiStrings.hourly] = hourly!.toJson();
    }

    if (dailyUnits != null) {
      map[ApiStrings.dailyUnits] = dailyUnits!.toJson();
    }

    if (hourly != null) {
      map[ApiStrings.daily] = daily!.toJson();
    }

    return map;
  }
}
