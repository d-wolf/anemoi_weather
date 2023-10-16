import 'package:anemoi_weather/api/open_meteo/forecast/daily.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/hourly.dart';

class Current {
  final DateTime time;
  final int interval;
  final double? temperature2M;
  final int? relativehumidity2M;
  final double? apparentTemperature;
  final bool? isDay;
  final int? precipitation;
  final int? rain;
  final int? showers;
  final int? snowfall;
  final int? weathercode;
  final int? cloudcover;
  final double? pressureMsl;
  final double? surfacePressure;
  final double? windspeed10M;
  final int? winddirection10M;
  final int? windgusts10M;

  Current({
    required this.time,
    required this.interval,
    this.temperature2M,
    this.relativehumidity2M,
    this.apparentTemperature,
    this.isDay,
    this.precipitation,
    this.rain,
    this.showers,
    this.snowfall,
    this.weathercode,
    this.cloudcover,
    this.pressureMsl,
    this.surfacePressure,
    this.windspeed10M,
    this.winddirection10M,
    this.windgusts10M,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: DateTime.fromMillisecondsSinceEpoch((json['time'] as int) * 1000,
          isUtc: true),
      interval: json['interval'] as int,
      temperature2M: json.containsKey('temperature_2m')
          ? json['temperature_2m'] as double
          : null,
      relativehumidity2M: json.containsKey('relativehumidity_2m')
          ? json['relativehumidity_2m'] as int
          : null,
      apparentTemperature: json.containsKey('apparent_temperature')
          ? json['apparent_temperature'] as double
          : null,
      isDay: json.containsKey('is_day') ? (json['is_day'] as int) == 1 : null,
      precipitation: json.containsKey('precipitation')
          ? json['precipitation'] as int
          : null,
      rain: json.containsKey('rain') ? json['rain'] as int : null,
      showers: json.containsKey('showers') ? json['showers'] as int : null,
      snowfall: json.containsKey('snowfall') ? json['snowfall'] as int : null,
      weathercode:
          json.containsKey('weathercode') ? json['weathercode'] as int : null,
      cloudcover:
          json.containsKey('cloudcover') ? json['cloudcover'] as int : null,
      pressureMsl: json.containsKey('pressure_msl')
          ? json['pressure_msl'] as double
          : null,
      surfacePressure: json.containsKey('surface_pressure')
          ? json['surface_pressure'] as double
          : null,
      windspeed10M: json.containsKey('windspeed_10m')
          ? json['windspeed_10m'] as double
          : null,
      winddirection10M: json.containsKey('winddirection_10m')
          ? json['winddirection_10m'] as int
          : null,
      windgusts10M: json.containsKey('windgusts_10m')
          ? json['windgusts_10m'] as int
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time.millisecondsSinceEpoch ~/ 1000,
      'interval': interval,
    };

    if (temperature2M != null) {
      map['temperature_2m'] = temperature2M;
    }

    if (relativehumidity2M != null) {
      map['relativehumidity_2m'] = relativehumidity2M;
    }

    if (apparentTemperature != null) {
      map['apparent_temperature'] = apparentTemperature;
    }

    if (isDay != null) {
      map['isDay'] = isDay! ? 1 : 0;
    }

    if (precipitation != null) {
      map['precipitation'] = precipitation;
    }

    if (rain != null) {
      map['rain'] = rain;
    }

    if (snowfall != null) {
      map['snowfall'] = snowfall;
    }

    if (weathercode != null) {
      map['weathercode'] = weathercode;
    }

    if (cloudcover != null) {
      map['cloudcover'] = cloudcover;
    }

    if (pressureMsl != null) {
      map['pressure_msl'] = pressureMsl;
    }

    if (surfacePressure != null) {
      map['surface_pressure'] = surfacePressure;
    }

    if (windspeed10M != null) {
      map['windspeed_10m'] = windspeed10M;
    }

    if (winddirection10M != null) {
      map['winddirection_10m'] = winddirection10M;
    }

    if (windgusts10M != null) {
      map['windgusts_10m'] = windgusts10M;
    }

    return map;
  }
}

class CurrentUnits {
  final String time;
  final String interval;
  final String? temperature2M;
  final String? relativehumidity2M;
  final String? apparentTemperature;
  final String? isDay;
  final String? precipitation;
  final String? rain;
  final String? showers;
  final String? snowfall;
  final String? weathercode;
  final String? cloudcover;
  final String? pressureMsl;
  final String? surfacePressure;
  final String? windspeed10M;
  final String? winddirection10M;
  final String? windgusts10M;

  CurrentUnits({
    required this.time,
    required this.interval,
    this.temperature2M,
    this.relativehumidity2M,
    this.apparentTemperature,
    this.isDay,
    this.precipitation,
    this.rain,
    this.showers,
    this.snowfall,
    this.weathercode,
    this.cloudcover,
    this.pressureMsl,
    this.surfacePressure,
    this.windspeed10M,
    this.winddirection10M,
    this.windgusts10M,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'] as String,
      interval: json['interval'] as String,
      temperature2M: json.containsKey('temperature_2m')
          ? json['temperature_2m'] as String
          : null,
      relativehumidity2M: json.containsKey('relativehumidity_2m')
          ? json['relativehumidity_2m'] as String
          : null,
      apparentTemperature: json.containsKey('apparent_temperature')
          ? json['apparent_temperature'] as String
          : null,
      isDay: json.containsKey('is_day') ? json['is_day'] as String : null,
      precipitation: json.containsKey('precipitation')
          ? json['precipitation'] as String
          : null,
      rain: json.containsKey('rain') ? json['rain'] as String : null,
      showers: json.containsKey('showers') ? json['showers'] as String : null,
      snowfall:
          json.containsKey('snowfall') ? json['snowfall'] as String : null,
      weathercode: json.containsKey('weathercode')
          ? json['weathercode'] as String
          : null,
      cloudcover:
          json.containsKey('cloudcover') ? json['cloudcover'] as String : null,
      pressureMsl: json.containsKey('pressure_msl')
          ? json['pressure_msl'] as String
          : null,
      surfacePressure: json.containsKey('surface_pressure')
          ? json['surface_pressure'] as String
          : null,
      windspeed10M: json.containsKey('windspeed_10m')
          ? json['windspeed_10m'] as String
          : null,
      winddirection10M: json.containsKey('winddirection_10m')
          ? json['winddirection_10m'] as String
          : null,
      windgusts10M: json.containsKey('windgusts_10m')
          ? json['windgusts_10m'] as String
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time,
      'interval': interval,
    };

    if (temperature2M != null) {
      map['temperature_2m'] = temperature2M;
    }

    if (relativehumidity2M != null) {
      map['relativehumidity_2m'] = relativehumidity2M;
    }

    if (apparentTemperature != null) {
      map['apparent_temperature'] = apparentTemperature;
    }

    if (isDay != null) {
      map['is_day'] = isDay;
    }

    if (precipitation != null) {
      map['precipitation'] = precipitation;
    }

    if (rain != null) {
      map['rain'] = rain;
    }

    if (showers != null) {
      map['showers'] = showers;
    }

    if (snowfall != null) {
      map['snowfall'] = snowfall;
    }

    if (weathercode != null) {
      map['weathercode'] = weathercode;
    }

    if (cloudcover != null) {
      map['cloudcover'] = cloudcover;
    }

    if (pressureMsl != null) {
      map['pressure_msl'] = pressureMsl;
    }

    if (surfacePressure != null) {
      map['surface_pressure'] = surfacePressure;
    }

    if (windspeed10M != null) {
      map['windspeed_10m'] = windspeed10M;
    }

    if (winddirection10M != null) {
      map['winddirection_10m'] = winddirection10M;
    }

    if (windgusts10M != null) {
      map['windgusts_10m'] = windgusts10M;
    }

    return map;
  }
}
