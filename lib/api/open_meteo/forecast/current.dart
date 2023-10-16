class Current {
  DateTime time;
  int interval;
  double? temperature2M;
  int? relativehumidity2M;
  double? windspeed10M;
  int? weathercode;
  int? rain;
  int? snowfall;
  bool? isDay;

  Current({
    required this.time,
    required this.interval,
    this.temperature2M,
    this.relativehumidity2M,
    this.windspeed10M,
    this.weathercode,
    this.rain,
    this.snowfall,
    this.isDay,
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
      windspeed10M: json.containsKey('windspeed_10m')
          ? json['windspeed_10m'] as double
          : null,
      weathercode:
          json.containsKey('weathercode') ? json['weathercode'] as int : null,
      rain: json.containsKey('weathercode') ? json['weathercode'] as int : null,
      snowfall:
          json.containsKey('weathercode') ? json['weathercode'] as int : null,
      isDay: json.containsKey('is_day') ? (json['is_day'] as int) == 1 : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time.millisecondsSinceEpoch ~/ 1000,
      'interval': interval,
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

    if (isDay != null) {
      map['isDay'] = isDay! ? 1 : 0;
    }

    return map;
  }
}

class CurrentUnits {
  String time;
  String interval;
  String? temperature2M;
  String? relativehumidity2M;
  String? windspeed10M;
  String? weathercode;
  String? rain;
  String? snowfall;
  String? isDay;

  CurrentUnits({
    required this.time,
    required this.interval,
    this.temperature2M,
    this.relativehumidity2M,
    this.windspeed10M,
    this.weathercode,
    this.rain,
    this.snowfall,
    this.isDay,
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
      windspeed10M: json.containsKey('windspeed_10m')
          ? json['windspeed_10m'] as String
          : null,
      weathercode: json.containsKey('weathercode')
          ? json['weathercode'] as String
          : null,
      rain: json.containsKey('rain') ? json['rain'] as String : null,
      snowfall:
          json.containsKey('snowfall') ? json['snowfall'] as String : null,
      isDay: json.containsKey('is_day') ? json['is_day'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time,
      'interval': interval,
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

    if (isDay != null) {
      map['is_day'] = isDay!;
    }

    return map;
  }
}
