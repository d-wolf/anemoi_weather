import 'package:anemoi_weather/src/domain/forecast/entities/current.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/current_units.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/daily.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/daily_units.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/hourly.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/hourly_units.dart';
import 'package:equatable/equatable.dart';

class Forecast extends Equatable {
  const Forecast({
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

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        generationtimeMs,
        utcOffsetSeconds,
        timezone,
        timezoneAbbreviation,
        elevation,
        currentUnits,
        current,
        hourlyUnits,
        hourly,
        dailyUnits,
        daily,
      ];
}
