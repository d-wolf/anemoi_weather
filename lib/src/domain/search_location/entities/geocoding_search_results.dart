import 'package:equatable/equatable.dart';

class GeocodingSearchResults extends Equatable {
  const GeocodingSearchResults({
    required this.generationtimeMs,
    this.results = const [],
  });
  final List<GeocodingSearchResult> results;
  final double generationtimeMs;

  @override
  List<Object?> get props => [results, generationtimeMs];
}

class GeocodingSearchResult extends Equatable {
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

  @override
  List<Object?> get props => [id];
}
