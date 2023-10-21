import 'dart:convert';

import 'package:anemoi_weather/src/data/search_location/api_strings.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/search_location/entities/geocoding_search_results.dart';

class GeocodingSearchResultsModel extends GeocodingSearchResults {
  const GeocodingSearchResultsModel({
    required super.generationtimeMs,
    super.results,
  });

  factory GeocodingSearchResultsModel.fromJson(DataMap json) {
    return GeocodingSearchResultsModel(
      results: json.containsKey(ApiStrings.results)
          ? (json[ApiStrings.results] as List)
              .map((e) => GeocodingSearchResultModel.fromJson(e as DataMap))
              .toList()
          : [],
      generationtimeMs:
          double.parse(json[ApiStrings.generationtimeMs].toString()),
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
      id: int.parse(json[ApiStrings.id].toString()),
      name: json[ApiStrings.name].toString(),
      latitude: double.parse(json[ApiStrings.latitude].toString()),
      longitude: double.parse(json[ApiStrings.longitude].toString()),
      elevation: double.parse(json[ApiStrings.elevation].toString()),
      featureCode: json[ApiStrings.featureCode].toString(),
      timezone: json[ApiStrings.timezone].toString(),
      countryCode: json[ApiStrings.countryCode].toString(),
      countryId: int.parse(json[ApiStrings.countryId].toString()),
      country: json[ApiStrings.country].toString(),
      admin1Id: json.containsKey(ApiStrings.admin1Id)
          ? int.parse(json[ApiStrings.admin1Id].toString())
          : null,
      admin1: json.containsKey(ApiStrings.admin1)
          ? json[ApiStrings.admin1].toString()
          : null,
      admin2Id: json.containsKey(ApiStrings.admin2Id)
          ? int.parse(json[ApiStrings.admin2Id].toString())
          : null,
      admin2: json.containsKey(ApiStrings.admin2)
          ? json[ApiStrings.admin2].toString()
          : null,
      admin3Id: json.containsKey(ApiStrings.admin3Id)
          ? int.parse(json[ApiStrings.admin3Id].toString())
          : null,
      admin3: json.containsKey(ApiStrings.admin3)
          ? json[ApiStrings.admin3].toString()
          : null,
      admin4Id: json.containsKey(ApiStrings.admin4Id)
          ? int.parse(json[ApiStrings.admin4Id].toString())
          : null,
      admin4: json.containsKey(ApiStrings.admin4)
          ? json[ApiStrings.admin4].toString()
          : null,
      population: json.containsKey(ApiStrings.population)
          ? int.parse(json[ApiStrings.population].toString())
          : null,
      postcodes: json.containsKey(ApiStrings.postcodes)
          ? (json[ApiStrings.postcodes] as List).cast<String>()
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
