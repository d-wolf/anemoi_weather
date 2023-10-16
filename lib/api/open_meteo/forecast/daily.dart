import 'dart:convert';

class Daily {
  final List<DateTime> time;
  final List<int> weathercode;
  final List<double> temperature2MMax;
  final List<double> temperature2MMin;
  final List<double> apparentTemperatureMax;
  final List<double> apparentTemperatureMin;
  final List<String> sunrise;
  final List<String> sunset;
  final List<double> uvIndexMax;
  final List<double> uvIndexClearSkyMax;
  final List<double> precipitationSum;
  final List<double> rainSum;
  final List<int> showersSum;
  final List<double> snowfallSum;
  final List<int> precipitationHours;
  final List<int> precipitationProbabilityMax;
  final List<double> windspeed10MMax;
  final List<double> windgusts10MMax;
  final List<int> winddirection10MDominant;
  final List<double> shortwaveRadiationSum;
  final List<double> et0FaoEvapotranspiration;

  Daily({
    required this.time,
    this.weathercode = const [],
    this.temperature2MMax = const [],
    this.temperature2MMin = const [],
    this.apparentTemperatureMax = const [],
    this.apparentTemperatureMin = const [],
    this.sunrise = const [],
    this.sunset = const [],
    this.uvIndexMax = const [],
    this.uvIndexClearSkyMax = const [],
    this.precipitationSum = const [],
    this.rainSum = const [],
    this.showersSum = const [],
    this.snowfallSum = const [],
    this.precipitationHours = const [],
    this.precipitationProbabilityMax = const [],
    this.windspeed10MMax = const [],
    this.windgusts10MMax = const [],
    this.winddirection10MDominant = const [],
    this.shortwaveRadiationSum = const [],
    this.et0FaoEvapotranspiration = const [],
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: List<int>.from(json['time'])
          .map(
              (e) => DateTime.fromMillisecondsSinceEpoch(e * 1000, isUtc: true))
          .toList(),
      temperature2MMax: json.containsKey('temperature_2m_max')
          ? List<double>.from(json['temperature_2m_max'])
          : [],
      temperature2MMin: json.containsKey('temperature_2m_min')
          ? List<double>.from(json['temperature_2m_min'])
          : [],
      apparentTemperatureMax: json.containsKey('apparent_temperature_max')
          ? List<double>.from(json['apparent_temperature_max'])
          : [],
      apparentTemperatureMin: json.containsKey('apparent_temperature_min')
          ? List<double>.from(json['apparent_temperature_min'])
          : [],
      sunrise:
          json.containsKey('sunrise') ? List<String>.from(json['sunrise']) : [],
      sunset:
          json.containsKey('sunset') ? List<String>.from(json['sunset']) : [],
      uvIndexMax: json.containsKey('uv_index_max')
          ? List<double>.from(json['uv_index_max'])
          : [],
      uvIndexClearSkyMax: json.containsKey('uv_index_clear_sky_max')
          ? List<double>.from(json['uv_index_clear_sky_max'])
          : [],
      precipitationSum: json.containsKey('precipitation_sum')
          ? List<double>.from(json['precipitation_sum'])
          : [],
      rainSum: json.containsKey('rain_sum')
          ? List<double>.from(json['rain_sum'])
          : [],
      showersSum: json.containsKey('showers_sum')
          ? List<int>.from(json['showers_sum'])
          : [],
      snowfallSum: json.containsKey('snowfall_sum')
          ? List<double>.from(json['snowfall_sum'])
          : [],
      precipitationHours: json.containsKey('precipitation_hours')
          ? List<int>.from(json['precipitation_hours'])
          : [],
      precipitationProbabilityMax:
          json.containsKey('precipitation_probability_max')
              ? List<int>.from(json['precipitation_probability_max'])
              : [],
      windspeed10MMax: json.containsKey('windspeed_10m_max')
          ? List<double>.from(json['windspeed_10m_max'])
          : [],
      windgusts10MMax: json.containsKey('windgusts_10m_max')
          ? List<double>.from(json['windgusts_10m_max'])
          : [],
      winddirection10MDominant: json.containsKey('winddirection_10m_dominant')
          ? List<int>.from(json['winddirection_10m_dominant'])
          : [],
      shortwaveRadiationSum: json.containsKey('shortwave_radiation_sum')
          ? List<double>.from(json['shortwave_radiation_sum'])
          : [],
      et0FaoEvapotranspiration: json.containsKey('et0_fao_evapotranspiration')
          ? List<double>.from(json['et0_fao_evapotranspiration'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': jsonEncode(
          time.map((e) => e.millisecondsSinceEpoch ~/ 1000).toList()),
    };

    if (temperature2MMax.isNotEmpty) {
      map['temperature_2m_max'] = jsonEncode(temperature2MMax);
    }

    if (temperature2MMin.isNotEmpty) {
      map['temperature_2m_min'] = jsonEncode(temperature2MMin);
    }

    if (apparentTemperatureMax.isNotEmpty) {
      map['apparent_temperature_max'] = jsonEncode(apparentTemperatureMax);
    }

    if (apparentTemperatureMin.isNotEmpty) {
      map['apparent_temperature_min'] = jsonEncode(apparentTemperatureMin);
    }

    if (sunrise.isNotEmpty) {
      map['sunrise'] = jsonEncode(sunrise);
    }

    if (sunset.isNotEmpty) {
      map['sunset'] = jsonEncode(sunset);
    }

    if (sunset.isNotEmpty) {
      map['sunset'] = jsonEncode(sunset);
    }

    if (uvIndexMax.isNotEmpty) {
      map['uv_index_max'] = jsonEncode(uvIndexMax);
    }

    if (uvIndexClearSkyMax.isNotEmpty) {
      map['uv_index_clear_sky_max'] = jsonEncode(uvIndexClearSkyMax);
    }

    if (precipitationSum.isNotEmpty) {
      map['precipitation_sum'] = jsonEncode(precipitationSum);
    }

    if (rainSum.isNotEmpty) {
      map['rain_sum'] = jsonEncode(rainSum);
    }

    if (showersSum.isNotEmpty) {
      map['showers_sum'] = jsonEncode(showersSum);
    }

    if (snowfallSum.isNotEmpty) {
      map['snowfall_sum'] = jsonEncode(snowfallSum);
    }

    if (precipitationHours.isNotEmpty) {
      map['precipitation_hours'] = jsonEncode(precipitationHours);
    }

    if (precipitationProbabilityMax.isNotEmpty) {
      map['precipitation_probability_max'] =
          jsonEncode(precipitationProbabilityMax);
    }

    if (windspeed10MMax.isNotEmpty) {
      map['windspeed_10m_max'] = jsonEncode(windspeed10MMax);
    }

    if (windgusts10MMax.isNotEmpty) {
      map['windgusts_10m_max'] = jsonEncode(windgusts10MMax);
    }

    if (winddirection10MDominant.isNotEmpty) {
      map['winddirection_10m_dominant'] = jsonEncode(winddirection10MDominant);
    }

    if (winddirection10MDominant.isNotEmpty) {
      map['winddirection_10m_dominant'] = jsonEncode(winddirection10MDominant);
    }

    return map;
  }
}

class DailyUnits {
  final String time;
  final String? weathercode;
  final String? temperature2MMax;
  final String? temperature2MMin;
  final String? apparentTemperatureMax;
  final String? apparentTemperatureMin;
  final String? sunrise;
  final String? sunset;
  final String? uvIndexMax;
  final String? uvIndexClearSkyMax;
  final String? precipitationSum;
  final String? rainSum;
  final String? showersSum;
  final String? snowfallSum;
  final String? precipitationHours;
  final String? precipitationProbabilityMax;
  final String? windspeed10MMax;
  final String? windgusts10MMax;
  final String? winddirection10MDominant;
  final String? shortwaveRadiationSum;
  final String? et0FaoEvapotranspiration;

  DailyUnits({
    required this.time,
    this.weathercode,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.apparentTemperatureMin,
    this.sunrise,
    this.sunset,
    this.uvIndexMax,
    this.uvIndexClearSkyMax,
    this.precipitationSum,
    this.rainSum,
    this.showersSum,
    this.snowfallSum,
    this.precipitationHours,
    this.precipitationProbabilityMax,
    this.windspeed10MMax,
    this.windgusts10MMax,
    this.winddirection10MDominant,
    this.shortwaveRadiationSum,
    this.et0FaoEvapotranspiration,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'] as String,
      temperature2MMax: json.containsKey('temperature_2m_max')
          ? json['temperature_2m_max'] as String
          : null,
      temperature2MMin: json.containsKey('temperature_2m_min')
          ? json['temperature_2m_min'] as String
          : null,
      apparentTemperatureMax: json.containsKey('apparent_temperature_max')
          ? json['apparent_temperature_max'] as String
          : null,
      apparentTemperatureMin: json.containsKey('apparent_temperature_min')
          ? json['apparent_temperature_min'] as String
          : null,
      sunrise: json.containsKey('sunrise') ? json['sunrise'] as String : null,
      sunset: json.containsKey('sunset') ? json['sunset'] as String : null,
      uvIndexMax: json.containsKey('uv_index_max')
          ? json['uv_index_max'] as String
          : null,
      uvIndexClearSkyMax: json.containsKey('uv_index_clear_sky_max')
          ? json['uv_index_clear_sky_max'] as String
          : null,
      precipitationSum: json.containsKey('precipitation_sum')
          ? json['precipitation_sum'] as String
          : null,
      rainSum: json.containsKey('rain_sum') ? json['rain_sum'] as String : null,
      showersSum: json.containsKey('showers_sum')
          ? json['showers_sum'] as String
          : null,
      snowfallSum: json.containsKey('snowfall_sum')
          ? json['snowfall_sum'] as String
          : null,
      precipitationHours: json.containsKey('precipitation_hours')
          ? json['precipitation_hours'] as String
          : null,
      precipitationProbabilityMax:
          json.containsKey('precipitation_probability_max')
              ? json['precipitation_probability_max'] as String
              : null,
      windspeed10MMax: json.containsKey('windspeed_10m_max')
          ? json['windspeed_10m_max'] as String
          : null,
      windgusts10MMax: json.containsKey('windgusts_10m_max')
          ? json['windgusts_10m_max'] as String
          : null,
      winddirection10MDominant: json.containsKey('winddirection_10m_dominant')
          ? json['winddirection_10m_dominant'] as String
          : null,
      shortwaveRadiationSum: json.containsKey('shortwave_radiation_sum')
          ? json['shortwave_radiation_sum'] as String
          : null,
      et0FaoEvapotranspiration: json.containsKey('et0_fao_evapotranspiration')
          ? json['et0_fao_evapotranspiration'] as String
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'time': time,
    };

    if (temperature2MMax != null) {
      map['temperature_2m_max'] = temperature2MMax!;
    }

    if (temperature2MMin != null) {
      map['temperature_2m_min'] = temperature2MMin!;
    }

    if (apparentTemperatureMax != null) {
      map['apparent_temperature_max'] = apparentTemperatureMax!;
    }

    if (apparentTemperatureMin != null) {
      map['apparent_temperature_min'] = apparentTemperatureMin!;
    }

    if (apparentTemperatureMin != null) {
      map['apparent_temperature_min'] = apparentTemperatureMin!;
    }

    if (sunrise != null) {
      map['sunrise'] = sunrise!;
    }

    if (sunset != null) {
      map['sunset'] = sunset!;
    }

    if (uvIndexMax != null) {
      map['uv_index_max'] = uvIndexMax!;
    }

    if (uvIndexClearSkyMax != null) {
      map['uv_index_clear_sky_max'] = uvIndexClearSkyMax!;
    }

    if (precipitationSum != null) {
      map['precipitation_sum'] = precipitationSum!;
    }

    if (rainSum != null) {
      map['rain_sum'] = rainSum!;
    }

    if (showersSum != null) {
      map['showers_sum'] = showersSum!;
    }

    if (snowfallSum != null) {
      map['snowfall_sum'] = snowfallSum!;
    }

    if (precipitationHours != null) {
      map['precipitation_hours'] = precipitationHours!;
    }

    if (precipitationProbabilityMax != null) {
      map['precipitation_probability_max'] = precipitationProbabilityMax!;
    }

    if (windgusts10MMax != null) {
      map['windspeed_10m_max'] = windgusts10MMax!;
    }

    if (winddirection10MDominant != null) {
      map['winddirection_10m_dominant'] = winddirection10MDominant!;
    }

    if (shortwaveRadiationSum != null) {
      map['shortwave_radiation_sum'] = shortwaveRadiationSum!;
    }

    if (shortwaveRadiationSum != null) {
      map['shortwave_radiation_sum'] = shortwaveRadiationSum!;
    }

    if (et0FaoEvapotranspiration != null) {
      map['et0_fao_evapotranspiration'] = et0FaoEvapotranspiration!;
    }

    return map;
  }
}
