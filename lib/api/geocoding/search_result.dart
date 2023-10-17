import 'dart:convert';

import 'package:anemoi_weather/api/geocoding/api_strings.dart';

class SearchSearch {
  final List<Result> results;
  final double generationtimeMs;

  SearchSearch({
    required this.results,
    required this.generationtimeMs,
  });

  factory SearchSearch.fromJson(Map<String, dynamic> json) {
    return SearchSearch(
      results: List<dynamic>.from(json[ApiStrings.results])
          .map((e) => Result.fromJson(e))
          .toList(),
      generationtimeMs: json[ApiStrings.generationtimeMs],
    );
  }
}

class Result {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final int elevation;
  final String featureCode;
  final String countryCode;
  final int admin1Id;
  final int admin3Id;
  final int admin4Id;
  final String timezone;
  final int population;
  final List<String> postcodes;
  final int countryId;
  final String country;
  final String admin1;
  final String admin3;
  final String admin4;
  final int admin2Id;
  final String admin2;

  Result({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.admin1Id,
    required this.admin1,
    required this.admin2Id,
    required this.admin2,
    required this.admin3Id,
    required this.admin3,
    required this.admin4Id,
    required this.admin4,
    required this.timezone,
    required this.population,
    required this.postcodes,
    required this.countryId,
    required this.country,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json[ApiStrings.id] as int,
      name: json[ApiStrings.name] as String,
      latitude: json[ApiStrings.latitude] as double,
      longitude: json[ApiStrings.longitude] as double,
      elevation: json[ApiStrings.elevation] as int,
      featureCode: json[ApiStrings.featureCode] as String,
      countryCode: json[ApiStrings.countryCode] as String,
      admin1Id: json[ApiStrings.admin1Id] as int,
      admin1: json[ApiStrings.admin1] as String,
      admin2Id: json[ApiStrings.admin2Id] as int,
      admin2: json[ApiStrings.admin2] as String,
      admin3Id: json[ApiStrings.admin3Id] as int,
      admin3: json[ApiStrings.admin3] as String,
      admin4Id: json[ApiStrings.admin4Id] as int,
      admin4: json[ApiStrings.admin4] as String,
      timezone: json[ApiStrings.timezone] as String,
      population: json[ApiStrings.population] as int,
      postcodes: List<String>.from(json[ApiStrings.postcodes]),
      countryId: json[ApiStrings.countryId] as int,
      country: json[ApiStrings.country] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      ApiStrings.id: id,
      ApiStrings.name: name,
      ApiStrings.latitude: latitude,
      ApiStrings.longitude: longitude,
      ApiStrings.elevation: elevation,
      ApiStrings.featureCode: featureCode,
      ApiStrings.countryCode: countryCode,
      ApiStrings.admin1Id: admin1Id,
      ApiStrings.admin1: admin1,
      ApiStrings.admin2Id: admin2Id,
      ApiStrings.admin2: admin2,
      ApiStrings.admin3Id: admin3Id,
      ApiStrings.admin3: admin3,
      ApiStrings.admin4Id: admin4Id,
      ApiStrings.admin4: admin4,
      ApiStrings.timezone: timezone,
      ApiStrings.population: population,
      ApiStrings.postcodes: jsonEncode(postcodes),
      ApiStrings.countryId: countryId,
      ApiStrings.country: country,
    };

    return map;
  }
}
