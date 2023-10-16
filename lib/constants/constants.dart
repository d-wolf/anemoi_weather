import 'package:anemoi_weather/icons/weather_icons.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();

  /// World Meteorological Organization
  ///
  /// wi-wmo4680-0, wi-wmo4680-00: thermometer
  /// wi-wmo4680-1, wi-wmo4680-01: cloudy
  /// wi-wmo4680-2. wi-wmo4680-02: thermometer
  /// wi-wmo4680-3, wi-wmo4680-03: cloudy
  /// wi-wmo4680-4, wi-wmo4680-04: fog
  /// wi-wmo4680-5, wi-wmo4680-05: fog
  /// wi-wmo4680-10: fog
  /// wi-wmo4680-11: fog
  /// wi-wmo4680-12: lightning
  /// wi-wmo4680-18: strong-wind
  /// wi-wmo4680-20: fog
  /// wi-wmo4680-21: rain-mix
  /// wi-wmo4680-22: rain-mix
  /// wi-wmo4680-23: rain
  /// wi-wmo4680-24: snow
  /// wi-wmo4680-25: hail
  /// wi-wmo4680-26: thunderstorm
  /// wi-wmo4680-27: dust
  /// wi-wmo4680-28: dust
  /// wi-wmo4680-29: dust
  /// wi-wmo4680-30: fog
  /// wi-wmo4680-31: fog
  /// wi-wmo4680-32: fog
  /// wi-wmo4680-33: fog
  /// wi-wmo4680-34: fog
  /// wi-wmo4680-35: fog
  /// wi-wmo4680-40: rain-mix
  /// wi-wmo4680-41: sprinkle
  /// wi-wmo4680-42: rain
  /// wi-wmo4680-43: sprinkle
  /// wi-wmo4680-44: rain
  /// wi-wmo4680-45: hail
  /// wi-wmo4680-46: hail
  /// wi-wmo4680-47: snow
  /// wi-wmo4680-48: snow
  /// wi-wmo4680-50: sprinkle
  /// wi-wmo4680-51: sprinkle
  /// wi-wmo4680-52: rain
  /// wi-wmo4680-53: rain
  /// wi-wmo4680-54: snowflake-cold
  /// wi-wmo4680-55: snowflake-cold
  /// wi-wmo4680-56: snowflake-cold
  /// wi-wmo4680-57: sprinkle
  /// wi-wmo4680-58: rain
  /// wi-wmo4680-60: sprinkle
  /// wi-wmo4680-61: sprinkle
  /// wi-wmo4680-62: rain
  /// wi-wmo4680-63: rain
  /// wi-wmo4680-64: hail
  /// wi-wmo4680-65: hail
  /// wi-wmo4680-66: hail
  /// wi-wmo4680-67: rain-mix
  /// wi-wmo4680-68: rain-mix
  /// wi-wmo4680-70: snow
  /// wi-wmo4680-71: snow
  /// wi-wmo4680-72: snow
  /// wi-wmo4680-73: snow
  /// wi-wmo4680-74: snowflake-cold
  /// wi-wmo4680-75: snowflake-cold
  /// wi-wmo4680-76: snowflake-cold
  /// wi-wmo4680-77: snow
  /// wi-wmo4680-78: snowflake-cold
  /// wi-wmo4680-80: rain
  /// wi-wmo4680-81: sprinkle
  /// wi-wmo4680-82: rain
  /// wi-wmo4680-83: rain
  /// wi-wmo4680-84: storm-showers
  /// wi-wmo4680-85: rain-mix
  /// wi-wmo4680-86: rain-mix
  /// wi-wmo4680-87: rain-mix
  /// wi-wmo4680-89: hail
  /// wi-wmo4680-90: lightning
  /// wi-wmo4680-91: storm-showers
  /// wi-wmo4680-92: thunderstorm
  /// wi-wmo4680-93: thunderstorm
  /// wi-wmo4680-94: lightning
  /// wi-wmo4680-95: thunderstorm
  /// wi-wmo4680-96: thunderstorm
  /// wi-wmo4680-99: tornado

  static const wmoIconMap = <int, IconData>{
    0: Weather.wi_thermometer,
    1: Weather.wi_cloudy,
    2: Weather.wi_thermometer,
    3: Weather.wi_cloudy,
    4: Weather.wi_fog,
    5: Weather.wi_fog,
    10: Weather.wi_fog,
    11: Weather.wi_fog,
    12: Weather.wi_lightning,
    18: Weather.wi_strong_wind,
    20: Weather.wi_fog,
    21: Weather.wi_rain_mix,
    22: Weather.wi_rain_mix,
    23: Weather.wi_rain,
    24: Weather.wi_snow,
    25: Weather.wi_hail,
    26: Weather.wi_thunderstorm,
    27: Weather.wi_dust,
    28: Weather.wi_dust,
    29: Weather.wi_dust,
    30: Weather.wi_fog,
    31: Weather.wi_fog,
    32: Weather.wi_fog,
    33: Weather.wi_fog,
    34: Weather.wi_fog,
    35: Weather.wi_fog,
    40: Weather.wi_rain_mix,
    41: Weather.wi_sprinkle,
    42: Weather.wi_rain,
    43: Weather.wi_sprinkle,
    44: Weather.wi_rain,
    45: Weather.wi_hail,
    46: Weather.wi_hail,
    47: Weather.wi_snow,
    48: Weather.wi_snow,
    50: Weather.wi_sprinkle,
    51: Weather.wi_sprinkle,
    52: Weather.wi_rain,
    53: Weather.wi_rain,
    54: Weather.wi_snowflake_cold,
    55: Weather.wi_snowflake_cold,
    56: Weather.wi_snowflake_cold,
    57: Weather.wi_sprinkle,
    58: Weather.wi_rain,
    60: Weather.wi_sprinkle,
    61: Weather.wi_sprinkle,
    62: Weather.wi_rain,
    63: Weather.wi_rain,
    64: Weather.wi_hail,
    65: Weather.wi_hail,
    66: Weather.wi_hail,
    67: Weather.wi_rain_mix,
    68: Weather.wi_rain_mix,
    70: Weather.wi_snow,
    71: Weather.wi_snow,
    72: Weather.wi_snow,
    73: Weather.wi_snow,
    74: Weather.wi_snowflake_cold,
    75: Weather.wi_snowflake_cold,
    76: Weather.wi_snowflake_cold,
    77: Weather.wi_snow,
    78: Weather.wi_snowflake_cold,
    80: Weather.wi_rain,
    81: Weather.wi_sprinkle,
    82: Weather.wi_rain,
    83: Weather.wi_rain,
    84: Weather.wi_storm_showers,
    85: Weather.wi_rain_mix,
    86: Weather.wi_rain_mix,
    87: Weather.wi_rain_mix,
    89: Weather.wi_hail,
    90: Weather.wi_lightning,
    91: Weather.wi_storm_showers,
    92: Weather.wi_thunderstorm,
    93: Weather.wi_thunderstorm,
    94: Weather.wi_lightning,
    95: Weather.wi_thunderstorm,
    96: Weather.wi_thunderstorm,
    99: Weather.wi_tornado,
  };
}
