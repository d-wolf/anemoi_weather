import 'dart:convert';

class Hourly {
  List<DateTime> time;
  List<double> temperature2M;
  List<int> relativehumidity2M;
  List<double> windspeed10M;
  List<int> weathercode;
  List<int> rain;
  List<int> snowfall;

  Hourly({
    required this.time,
    this.temperature2M = const [],
    this.relativehumidity2M = const [],
    this.windspeed10M = const [],
    this.weathercode = const [],
    this.rain = const [],
    this.snowfall = const [],
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: List<int>.from(json['time'])
          .map(
              (e) => DateTime.fromMillisecondsSinceEpoch(e * 1000, isUtc: true))
          .toList(),
      temperature2M: json.containsKey('temperature_2m')
          ? List<double>.from(json['temperature_2m'])
          : [],
      relativehumidity2M: json.containsKey('relativehumidity_2m')
          ? List<int>.from(json['relativehumidity_2m'])
          : [],
      windspeed10M: json.containsKey('windspeed_10m')
          ? List<double>.from(json['windspeed_10m'])
          : [],
      weathercode: json.containsKey('weathercode')
          ? List<int>.from(json['weathercode'])
          : [],
      rain: json.containsKey('rain') ? List<int>.from(json['rain']) : [],
      snowfall:
          json.containsKey('snowfall') ? List<int>.from(json['snowfall']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': jsonEncode(
          time.map((e) => e.millisecondsSinceEpoch ~/ 1000).toList()),
    };

    if (temperature2M.isNotEmpty) {
      map['temperature_2m'] = jsonEncode(temperature2M);
    }

    if (relativehumidity2M.isNotEmpty) {
      map['relativehumidity_2m'] = jsonEncode(relativehumidity2M);
    }

    if (windspeed10M.isNotEmpty) {
      map['windspeed_10m'] = jsonEncode(windspeed10M);
    }

    if (weathercode.isNotEmpty) {
      map['weathercode'] = jsonEncode(weathercode);
    }

    if (rain.isNotEmpty) {
      map['rain'] = jsonEncode(rain);
    }

    if (snowfall.isNotEmpty) {
      map['snowfall'] = jsonEncode(snowfall);
    }

    return map;
  }
}

class HourlyUnits {
  String time;
  String? temperature2M;
  String? relativehumidity2M;
  String? windspeed10M;
  String? weathercode;
  String? rain;
  String? snowfall;

  HourlyUnits({
    required this.time,
    this.temperature2M,
    this.relativehumidity2M,
    this.windspeed10M,
    this.weathercode,
    this.rain,
    this.snowfall,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json['time'] as String,
      temperature2M: json.containsKey('temperature_2m')
          ? json['temperature_2m'] as String
          : null,
      relativehumidity2M: json.containsKey('relativehumidity_2m')
          ? json['relativehumidity_2m'] as String
          : null,
      windspeed10M: json.containsKey('windspeed_10m')
          ? json['windspeed_10m'] as String
          : null,
      weathercode: json.containsKey('weathercode')
          ? json['weathercode'] as String
          : null,
      rain: json.containsKey('rain') ? json['rain'] as String : null,
      snowfall:
          json.containsKey('snowfall') ? json['snowfall'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time,
    };

    if (temperature2M != null) {
      map['temperature_2m'] = temperature2M!;
    }

    if (relativehumidity2M != null) {
      map['relativehumidity_2m'] = relativehumidity2M!;
    }

    if (windspeed10M != null) {
      map['windspeed_10m'] = windspeed10M!;
    }

    if (weathercode != null) {
      map['weathercode'] = weathercode!;
    }

    if (rain != null) {
      map['rain'] = rain!;
    }

    if (snowfall != null) {
      map['snowfall'] = snowfall!;
    }

    return map;
  }
}
