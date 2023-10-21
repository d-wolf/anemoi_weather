import 'dart:convert';

import 'package:anemoi_weather/src/data/forecast/models/forecast_model.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../../utils/fixture_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  final fixtureReader =
      FixtureReader(basePath: 'test/src/data/forecast/fixtures');

  test(
      '[ForecastModel.fromJson]'
      ' should parse basic json', () async {
    final json = fixtureReader.read('forecast_basic.json');

    expect(
      ForecastModel.fromJson(jsonDecode(json) as DataMap),
      const ForecastModel(
        latitude: 52.52,
        longitude: 13.419998,
        generationtimeMs: 0.0019073486328125,
        utcOffsetSeconds: 0,
        timezone: 'GMT',
        timezoneAbbreviation: 'GMT',
        elevation: 38,
      ),
    );
  });

  test(
      '[ForecastModel.fromJson]'
      ' returns normally', () {
    final json = fixtureReader.read('forecast_full.json');

    expect(
      () => ForecastModel.fromJson(jsonDecode(json) as DataMap),
      returnsNormally,
    );
  });
}
