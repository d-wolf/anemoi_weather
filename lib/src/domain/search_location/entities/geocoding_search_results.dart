import 'package:equatable/equatable.dart';

class GeocodingSearchResults extends Equatable {
  final List<GeocodingSearchResult> results;
  final double generationtimeMs;

  const GeocodingSearchResults({
    this.results = const [],
    required this.generationtimeMs,
  });

  @override
  List<Object?> get props => [results, generationtimeMs];
}

class GeocodingSearchResult extends Equatable {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double elevation;
  final String featureCode;
  final String countryCode;
  final int? admin1Id;
  final String? admin1;
  final int? admin2Id;
  final String? admin2;
  final int? admin3Id;
  final String? admin3;
  final int? admin4Id;
  final String? admin4;
  final String timezone;
  final int? population;
  final List<String> postcodes;
  final int countryId;
  final String country;

  const GeocodingSearchResult({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.timezone,
    required this.countryId,
    required this.country,
    this.admin1Id,
    this.admin1,
    this.admin2Id,
    this.admin2,
    this.admin3Id,
    this.admin3,
    this.admin4Id,
    this.admin4,
    this.population,
    this.postcodes = const [],
  });

  @override
  List<Object?> get props => [id];
}
