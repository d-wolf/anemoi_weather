import 'dart:convert';

import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/data/search_location/api_strings.dart';
import 'package:anemoi_weather/src/domain/search_location/entities/geocoding_search_results.dart';

class GeocodingSearchResultsModel extends GeocodingSearchResults {
  const GeocodingSearchResultsModel({
    super.results,
    required super.generationtimeMs,
  });

  factory GeocodingSearchResultsModel.fromJson(DataMap json) {
    return GeocodingSearchResultsModel(
      results: json.containsKey(ApiStrings.results)
          ? List<dynamic>.from(json[ApiStrings.results])
              .map((e) => GeocodingSearchResultModel.fromJson(e))
              .toList()
          : [],
      generationtimeMs: json[ApiStrings.generationtimeMs],
    );
  }

  DataMap toJson() {
    return <String, dynamic>{
      ApiStrings.results: jsonEncode(results),
      ApiStrings.generationtimeMs: generationtimeMs,
    };
  }
}

class GeocodingSearchResultModel extends GeocodingSearchResult {
  const GeocodingSearchResultModel({
    required super.id,
    required super.name,
    required super.latitude,
    required super.longitude,
    required super.elevation,
    required super.featureCode,
    required super.countryCode,
    required super.timezone,
    required super.countryId,
    required super.country,
    super.admin1Id,
    super.admin1,
    super.admin2Id,
    super.admin2,
    super.admin3Id,
    super.admin3,
    super.admin4Id,
    super.admin4,
    super.population,
    super.postcodes = const [],
  });

  GeocodingSearchResultModel.fromDomain(GeocodingSearchResult result)
      : this(
          country: result.country,
          countryCode: result.countryCode,
          countryId: result.countryId,
          elevation: result.elevation,
          featureCode: result.featureCode,
          id: result.id,
          latitude: result.latitude,
          longitude: result.longitude,
          name: result.name,
          timezone: result.timezone,
          admin1: result.admin1,
          admin1Id: result.admin1Id,
          admin2: result.admin2,
          admin2Id: result.admin2Id,
          admin3: result.admin3,
          admin3Id: result.admin3Id,
          admin4: result.admin4,
          admin4Id: result.admin4Id,
          population: result.population,
          postcodes: result.postcodes,
        );

  factory GeocodingSearchResultModel.fromJson(DataMap json) {
    return GeocodingSearchResultModel(
      id: json[ApiStrings.id] as int,
      name: json[ApiStrings.name] as String,
      latitude: json[ApiStrings.latitude] as double,
      longitude: json[ApiStrings.longitude] as double,
      elevation: json[ApiStrings.elevation] as double,
      featureCode: json[ApiStrings.featureCode] as String,
      timezone: json[ApiStrings.timezone] as String,
      countryCode: json[ApiStrings.countryCode] as String,
      countryId: json[ApiStrings.countryId] as int,
      country: json[ApiStrings.country] as String,
      admin1Id: json.containsKey(ApiStrings.admin1Id)
          ? json[ApiStrings.admin1Id] as int
          : null,
      admin1: json.containsKey(ApiStrings.admin1)
          ? json[ApiStrings.admin1] as String
          : null,
      admin2Id: json.containsKey(ApiStrings.admin2Id)
          ? json[ApiStrings.admin2Id] as int
          : null,
      admin2: json.containsKey(ApiStrings.admin2)
          ? json[ApiStrings.admin2] as String
          : null,
      admin3Id: json.containsKey(ApiStrings.admin3Id)
          ? json[ApiStrings.admin3Id] as int
          : null,
      admin3: json.containsKey(ApiStrings.admin3)
          ? json[ApiStrings.admin3] as String
          : null,
      admin4Id: json.containsKey(ApiStrings.admin4Id)
          ? json[ApiStrings.admin4Id] as int
          : null,
      admin4: json.containsKey(ApiStrings.admin4)
          ? json[ApiStrings.admin4] as String
          : null,
      population: json.containsKey(ApiStrings.population)
          ? json[ApiStrings.population] as int
          : null,
      postcodes: json.containsKey(ApiStrings.postcodes)
          ? List<String>.from(json[ApiStrings.postcodes])
          : [],
    );
  }

  DataMap toJson() {
    final map = <String, dynamic>{
      ApiStrings.id: id,
      ApiStrings.name: name,
      ApiStrings.latitude: latitude,
      ApiStrings.longitude: longitude,
      ApiStrings.elevation: elevation,
      ApiStrings.featureCode: featureCode,
      ApiStrings.countryCode: countryCode,
      ApiStrings.timezone: timezone,
      ApiStrings.countryId: countryId,
      ApiStrings.country: country,
      ApiStrings.postcodes: jsonEncode(postcodes),
    };

    if (admin1Id != null) {
      map[ApiStrings.admin1Id] = admin1Id;
    }

    if (admin2 != null) {
      map[ApiStrings.admin2] = admin2;
    }

    if (admin2Id != null) {
      map[ApiStrings.admin2Id] = admin2Id;
    }

    if (admin2 != null) {
      map[ApiStrings.admin2] = admin2;
    }

    if (admin3Id != null) {
      map[ApiStrings.admin3Id] = admin3Id;
    }

    if (admin3 != null) {
      map[ApiStrings.admin3] = admin3;
    }

    if (admin4Id != null) {
      map[ApiStrings.admin4Id] = admin4Id;
    }

    if (admin4 != null) {
      map[ApiStrings.admin4] = admin4;
    }

    if (population != null) {
      map[ApiStrings.population] = population;
    }

    return map;
  }
}
