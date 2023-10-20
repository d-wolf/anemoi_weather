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
}
