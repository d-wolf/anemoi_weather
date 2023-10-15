import 'package:anemoi_weather/api/open_meteo/forecast/current.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/hourly.dart';

class Forecast {
  double latitude;
  double longitude;
  double generationtimeMs;
  int utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  double elevation;
  Current? current;
  Hourly? hourly;

  Forecast({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    this.current,
    this.hourly,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final fc = Forecast(
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double,
        generationtimeMs: json['generationtime_ms'] as double,
        utcOffsetSeconds: json['utc_offset_seconds'] as int,
        timezone: json['timezone'] as String,
        timezoneAbbreviation: json['timezone_abbreviation'] as String,
        elevation: json['elevation'] as double);

    if (json.containsKey('current')) {
      fc.current = Current.fromJson(json['current']);
    }

    if (json.containsKey('hourly')) {
      fc.hourly = Hourly.fromJson(json['hourly']);
    }

    return fc;
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

    if (current != null) {
      map['current'] = current!.toJson();
    }

    if (hourly != null) {
      map['hourly'] = hourly!.toJson();
    }

    return map;
  }
}
