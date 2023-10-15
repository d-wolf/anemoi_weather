class Current {
  DateTime time;
  int interval;
  double? temperature2M;
  double? windspeed10M;

  Current({
    required this.time,
    required this.interval,
    this.temperature2M,
    this.windspeed10M,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: DateTime.fromMillisecondsSinceEpoch((json['time'] as int) * 1000,
          isUtc: true),
      interval: json['interval'] as int,
      temperature2M: json.containsKey('temperature_2m')
          ? json['temperature_2m'] as double
          : null,
      windspeed10M: json.containsKey('windspeed_10m')
          ? json['windspeed_10m'] as double
          : null,
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

    if (windspeed10M != null) {
      map['windspeed_10m'] = windspeed10M!;
    }

    return map;
  }
}

class CurrentUnits {
  String time;
  String interval;
  String? temperature2M;
  String? windspeed10M;

  CurrentUnits({
    required this.time,
    required this.interval,
    this.temperature2M,
    this.windspeed10M,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'] as String,
      interval: json['interval'] as String,
      temperature2M: json.containsKey('temperature_2m')
          ? json['temperature_2m'] as String
          : null,
      windspeed10M: json.containsKey('windspeed_10m')
          ? json['windspeed_10m'] as String
          : null,
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

    if (windspeed10M != null) {
      map['windspeed_10m'] = windspeed10M!;
    }

    return map;
  }
}
