class Current {
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
  final DateTime time;
  final int interval;
  final double? temperature2M;
  final int? relativehumidity2M;
  final double? apparentTemperature;
  final bool? isDay;
  final double? precipitation;
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
}
