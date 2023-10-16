import 'package:anemoi_weather/api/open_meteo/forecast/current.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/daily.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/hourly.dart';

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
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      generationtimeMs: json['generationtime_ms'] as double,
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: json['elevation'] as double,
      currentUnits: json.containsKey('current_units')
          ? CurrentUnits.fromJson(json['current_units'])
          : null,
      current: json.containsKey('current')
          ? Current.fromJson(json['current'])
          : null,
      hourlyUnits: json.containsKey('hourly_units')
          ? HourlyUnits.fromJson(json['hourly_units'])
          : null,
      hourly:
          json.containsKey('hourly') ? Hourly.fromJson(json['hourly']) : null,
      dailyUnits: json.containsKey('daily_units')
          ? DailyUnits.fromJson(json['daily_units'])
          : null,
      daily: json.containsKey('hourly') ? Daily.fromJson(json['hourly']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'generationtime_ms': generationtimeMs,
      'utc_offset_seconds': utcOffsetSeconds,
      'timezone': timezone,
      'timezoneAbbreviation': timezoneAbbreviation,
      'elevation': elevation,
    };

    if (currentUnits != null) {
      map['current_units'] = currentUnits!.toJson();
    }

    if (current != null) {
      map['current'] = current!.toJson();
    }

    if (hourlyUnits != null) {
      map['hourly_units'] = hourlyUnits!.toJson();
    }

    if (hourly != null) {
      map['hourly'] = hourly!.toJson();
    }

    if (dailyUnits != null) {
      map['daily_units'] = dailyUnits!.toJson();
    }

    if (hourly != null) {
      map['daily'] = daily!.toJson();
    }

    return map;
  }
}
