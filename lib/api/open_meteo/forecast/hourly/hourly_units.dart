import 'package:anemoi_weather/api/open_meteo/forecast/api_strings.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/hourly/enums.dart';

class HourlyUnits {
  final String time;
  final String? temperature2M;
  final String? relativehumidity2M;
  final String? dewpoint2M;
  final String? apparentTemperature;
  final String? precipitationProbability;
  final String? precipitation;
  final String? rain;
  final String? showers;
  final String? snowfall;
  final String? snowDepth;
  final String? weathercode;
  final String? pressureMsl;
  final String? surfacePressure;
  final String? cloudcover;
  final String? cloudcoverLow;
  final String? cloudcoverMid;
  final String? cloudcoverHigh;
  final String? visibility;
  final String? evapotranspiration;
  final String? et0FaoEvapotranspiration;
  final String? vaporPressureDeficit;
  final String? windspeed10M;
  final String? windspeed80M;
  final String? windspeed120M;
  final String? windspeed180M;
  final String? winddirection10M;
  final String? winddirection80M;
  final String? winddirection120M;
  final String? winddirection180M;
  final String? windgusts10M;
  final String? temperature80M;
  final String? temperature120M;
  final String? temperature180M;
  final String? soilTemperature0Cm;
  final String? soilTemperature6Cm;
  final String? soilTemperature18Cm;
  final String? soilTemperature54Cm;
  final String? soilMoisture0To1Cm;
  final String? soilMoisture1To3Cm;
  final String? soilMoisture3To9Cm;
  final String? soilMoisture9To27Cm;
  final String? soilMoisture27To81Cm;

  HourlyUnits({
    required this.time,
    this.temperature2M,
    this.relativehumidity2M,
    this.dewpoint2M,
    this.apparentTemperature,
    this.precipitationProbability,
    this.precipitation,
    this.rain,
    this.showers,
    this.snowfall,
    this.snowDepth,
    this.weathercode,
    this.pressureMsl,
    this.surfacePressure,
    this.cloudcover,
    this.cloudcoverLow,
    this.cloudcoverMid,
    this.cloudcoverHigh,
    this.visibility,
    this.evapotranspiration,
    this.et0FaoEvapotranspiration,
    this.vaporPressureDeficit,
    this.windspeed10M,
    this.windspeed80M,
    this.windspeed120M,
    this.windspeed180M,
    this.winddirection10M,
    this.winddirection80M,
    this.winddirection120M,
    this.winddirection180M,
    this.windgusts10M,
    this.temperature80M,
    this.temperature120M,
    this.temperature180M,
    this.soilTemperature0Cm,
    this.soilTemperature6Cm,
    this.soilTemperature18Cm,
    this.soilTemperature54Cm,
    this.soilMoisture0To1Cm,
    this.soilMoisture1To3Cm,
    this.soilMoisture3To9Cm,
    this.soilMoisture9To27Cm,
    this.soilMoisture27To81Cm,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json[ApiStrings.time] as String,
      temperature2M: json.containsKey(HourlyParameters.temperature2M.value)
          ? json[HourlyParameters.temperature2M.value] as String
          : null,
      relativehumidity2M:
          json.containsKey(HourlyParameters.relativehumidity2M.value)
              ? json[HourlyParameters.relativehumidity2M.value] as String
              : null,
      dewpoint2M: json.containsKey(HourlyParameters.dewpoint2M.value)
          ? json[HourlyParameters.dewpoint2M.value] as String
          : null,
      apparentTemperature:
          json.containsKey(HourlyParameters.apparentTemperature.value)
              ? json[HourlyParameters.apparentTemperature.value] as String
              : null,
      precipitationProbability:
          json.containsKey(HourlyParameters.precipitationProbability.value)
              ? json[HourlyParameters.precipitationProbability.value] as String
              : null,
      precipitation: json.containsKey(HourlyParameters.precipitation.value)
          ? json[HourlyParameters.precipitation.value] as String
          : null,
      rain: json.containsKey(HourlyParameters.rain.value)
          ? json[HourlyParameters.rain.value] as String
          : null,
      showers: json.containsKey(HourlyParameters.showers.value)
          ? json[HourlyParameters.showers.value] as String
          : null,
      snowfall: json.containsKey(HourlyParameters.snowfall.value)
          ? json[HourlyParameters.snowfall.value] as String
          : null,
      snowDepth: json.containsKey(HourlyParameters.snowDepth.value)
          ? json[HourlyParameters.snowDepth.value] as String
          : null,
      weathercode: json.containsKey(HourlyParameters.weathercode.value)
          ? json[HourlyParameters.weathercode.value] as String
          : null,
      pressureMsl: json.containsKey(HourlyParameters.pressureMsl.value)
          ? json[HourlyParameters.pressureMsl.value] as String
          : null,
      surfacePressure: json.containsKey(HourlyParameters.surfacePressure.value)
          ? json[HourlyParameters.surfacePressure.value] as String
          : null,
      cloudcover: json.containsKey(HourlyParameters.cloudcover.value)
          ? json[HourlyParameters.cloudcover.value] as String
          : null,
      cloudcoverLow: json.containsKey(HourlyParameters.cloudcoverLow.value)
          ? json[HourlyParameters.cloudcoverLow.value] as String
          : null,
      cloudcoverMid: json.containsKey(HourlyParameters.cloudcoverMid.value)
          ? json[HourlyParameters.cloudcoverMid.value] as String
          : null,
      cloudcoverHigh: json.containsKey(HourlyParameters.cloudcoverHigh.value)
          ? json[HourlyParameters.cloudcoverHigh.value] as String
          : null,
      visibility: json.containsKey(HourlyParameters.visibility.value)
          ? json[HourlyParameters.visibility.value] as String
          : null,
      evapotranspiration:
          json.containsKey(HourlyParameters.evapotranspiration.value)
              ? json[HourlyParameters.evapotranspiration.value] as String
              : null,
      et0FaoEvapotranspiration:
          json.containsKey(HourlyParameters.et0FaoEvapotranspiration.value)
              ? json[HourlyParameters.et0FaoEvapotranspiration.value] as String
              : null,
      vaporPressureDeficit:
          json.containsKey(HourlyParameters.vaporPressureDeficit.value)
              ? json[HourlyParameters.vaporPressureDeficit.value] as String
              : null,
      windspeed10M: json.containsKey(HourlyParameters.windspeed10M.value)
          ? json[HourlyParameters.windspeed10M.value] as String
          : null,
      windspeed80M: json.containsKey(HourlyParameters.windspeed80M.value)
          ? json[HourlyParameters.windspeed80M.value] as String
          : null,
      windspeed120M: json.containsKey(HourlyParameters.windspeed120M.value)
          ? json[HourlyParameters.windspeed120M.value] as String
          : null,
      windspeed180M: json.containsKey(HourlyParameters.windspeed180M.value)
          ? json[HourlyParameters.windspeed180M.value] as String
          : null,
      winddirection10M:
          json.containsKey(HourlyParameters.winddirection10M.value)
              ? json[HourlyParameters.winddirection10M.value] as String
              : null,
      winddirection80M:
          json.containsKey(HourlyParameters.winddirection80M.value)
              ? json[HourlyParameters.winddirection80M.value] as String
              : null,
      winddirection120M:
          json.containsKey(HourlyParameters.winddirection120M.value)
              ? json[HourlyParameters.winddirection120M.value] as String
              : null,
      winddirection180M:
          json.containsKey(HourlyParameters.winddirection180M.value)
              ? json[HourlyParameters.winddirection180M.value] as String
              : null,
      windgusts10M: json.containsKey(HourlyParameters.windgusts10M.value)
          ? json[HourlyParameters.windgusts10M.value] as String
          : null,
      temperature80M: json.containsKey(HourlyParameters.temperature80M.value)
          ? json[HourlyParameters.temperature80M.value] as String
          : null,
      temperature120M: json.containsKey(HourlyParameters.temperature120M.value)
          ? json[HourlyParameters.temperature120M.value] as String
          : null,
      temperature180M: json.containsKey(HourlyParameters.temperature180M.value)
          ? json[HourlyParameters.temperature180M.value] as String
          : null,
      soilTemperature0Cm:
          json.containsKey(HourlyParameters.soilTemperature0Cm.value)
              ? json[HourlyParameters.soilTemperature0Cm.value] as String
              : null,
      soilTemperature6Cm:
          json.containsKey(HourlyParameters.soilTemperature6Cm.value)
              ? json[HourlyParameters.soilTemperature6Cm.value] as String
              : null,
      soilTemperature18Cm:
          json.containsKey(HourlyParameters.soilTemperature18Cm.value)
              ? json[HourlyParameters.soilTemperature18Cm.value] as String
              : null,
      soilTemperature54Cm:
          json.containsKey(HourlyParameters.soilTemperature54Cm.value)
              ? json[HourlyParameters.soilTemperature54Cm.value] as String
              : null,
      soilMoisture0To1Cm:
          json.containsKey(HourlyParameters.soilMoisture0To1Cm.value)
              ? json[HourlyParameters.soilMoisture0To1Cm.value] as String
              : null,
      soilMoisture1To3Cm:
          json.containsKey(HourlyParameters.soilMoisture1To3Cm.value)
              ? json[HourlyParameters.soilMoisture1To3Cm.value] as String
              : null,
      soilMoisture3To9Cm:
          json.containsKey(HourlyParameters.soilMoisture3To9Cm.value)
              ? json[HourlyParameters.soilMoisture3To9Cm.value] as String
              : null,
      soilMoisture9To27Cm:
          json.containsKey(HourlyParameters.soilMoisture9To27Cm.value)
              ? json[HourlyParameters.soilMoisture9To27Cm.value] as String
              : null,
      soilMoisture27To81Cm:
          json.containsKey(HourlyParameters.soilMoisture27To81Cm.value)
              ? json[HourlyParameters.soilMoisture27To81Cm.value] as String
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time,
    };

    if (temperature2M != null) {
      map[HourlyParameters.temperature2M.value] = temperature2M;
    }

    if (relativehumidity2M != null) {
      map[HourlyParameters.relativehumidity2M.value] = relativehumidity2M;
    }

    if (dewpoint2M != null) {
      map[HourlyParameters.dewpoint2M.value] = dewpoint2M;
    }

    if (apparentTemperature != null) {
      map[HourlyParameters.apparentTemperature.value] = apparentTemperature;
    }

    if (precipitationProbability != null) {
      map[HourlyParameters.precipitationProbability.value] =
          precipitationProbability;
    }

    if (precipitation != null) {
      map[HourlyParameters.precipitation.value] = precipitation;
    }

    if (rain != null) {
      map[HourlyParameters.rain.value] = rain;
    }

    if (showers != null) {
      map[HourlyParameters.showers.value] = showers;
    }

    if (snowfall != null) {
      map[HourlyParameters.snowfall.value] = snowfall;
    }

    if (snowDepth != null) {
      map[HourlyParameters.snowDepth.value] = snowDepth;
    }

    if (weathercode != null) {
      map[HourlyParameters.weathercode.value] = weathercode;
    }

    if (pressureMsl != null) {
      map[HourlyParameters.pressureMsl.value] = pressureMsl;
    }

    if (surfacePressure != null) {
      map[HourlyParameters.surfacePressure.value] = surfacePressure;
    }

    if (cloudcover != null) {
      map[HourlyParameters.cloudcover.value] = cloudcover;
    }

    if (cloudcoverLow != null) {
      map[HourlyParameters.cloudcoverLow.value] = cloudcoverLow;
    }

    if (cloudcoverMid != null) {
      map[HourlyParameters.cloudcoverMid.value] = cloudcoverMid;
    }

    if (cloudcoverHigh != null) {
      map[HourlyParameters.cloudcoverHigh.value] = cloudcoverHigh;
    }

    if (visibility != null) {
      map[HourlyParameters.visibility.value] = visibility;
    }

    if (evapotranspiration != null) {
      map[HourlyParameters.evapotranspiration.value] = evapotranspiration;
    }

    if (et0FaoEvapotranspiration != null) {
      map[HourlyParameters.et0FaoEvapotranspiration.value] =
          et0FaoEvapotranspiration;
    }

    if (vaporPressureDeficit != null) {
      map[HourlyParameters.vaporPressureDeficit.value] = vaporPressureDeficit;
    }

    if (windspeed10M != null) {
      map[HourlyParameters.windspeed10M.value] = windspeed10M;
    }

    if (windspeed80M != null) {
      map[HourlyParameters.windspeed80M.value] = windspeed80M;
    }

    if (windspeed120M != null) {
      map[HourlyParameters.windspeed120M.value] = windspeed120M;
    }

    if (windspeed180M != null) {
      map[HourlyParameters.winddirection180M.value] = windspeed180M;
    }

    if (winddirection10M != null) {
      map[HourlyParameters.winddirection10M.value] = winddirection10M;
    }

    if (winddirection80M != null) {
      map[HourlyParameters.winddirection80M.value] = winddirection80M;
    }

    if (winddirection120M != null) {
      map[HourlyParameters.winddirection120M.value] = winddirection120M;
    }

    if (winddirection180M != null) {
      map[HourlyParameters.winddirection180M.value] = winddirection180M;
    }

    if (windgusts10M != null) {
      map[HourlyParameters.windgusts10M.value] = windgusts10M;
    }

    if (temperature80M != null) {
      map[HourlyParameters.temperature80M.value] = temperature80M;
    }

    if (temperature120M != null) {
      map[HourlyParameters.temperature120M.value] = temperature120M;
    }

    if (temperature180M != null) {
      map[HourlyParameters.temperature180M.value] = temperature180M;
    }

    if (soilTemperature0Cm != null) {
      map[HourlyParameters.soilTemperature0Cm.value] = soilTemperature0Cm;
    }

    if (soilTemperature6Cm != null) {
      map[HourlyParameters.soilTemperature6Cm.value] = soilTemperature6Cm;
    }

    if (soilTemperature18Cm != null) {
      map[HourlyParameters.soilTemperature18Cm.value] = soilTemperature18Cm;
    }

    if (soilTemperature54Cm != null) {
      map[HourlyParameters.soilTemperature54Cm.value] = soilTemperature54Cm;
    }

    if (soilMoisture0To1Cm != null) {
      map[HourlyParameters.soilMoisture0To1Cm.value] = soilMoisture0To1Cm;
    }

    if (soilMoisture1To3Cm != null) {
      map[HourlyParameters.soilMoisture1To3Cm.value] = soilMoisture1To3Cm;
    }

    if (soilMoisture3To9Cm != null) {
      map[HourlyParameters.soilMoisture3To9Cm.value] = soilMoisture3To9Cm;
    }

    if (soilMoisture9To27Cm != null) {
      map[HourlyParameters.soilMoisture9To27Cm.value] = soilMoisture9To27Cm;
    }

    if (soilMoisture27To81Cm != null) {
      map[HourlyParameters.soilMoisture27To81Cm.value] = soilMoisture27To81Cm;
    }

    return map;
  }
}
