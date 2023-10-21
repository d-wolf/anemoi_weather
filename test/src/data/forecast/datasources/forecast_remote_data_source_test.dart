import 'package:anemoi_weather/src/data/forecast/datasources/forecast_remote_data_source.dart';
import 'package:anemoi_weather/src/data/forecast/models/forecast_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../../utils/fixture_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  final fixtureReader =
      FixtureReader(basePath: 'test/src/data/forecast/fixtures');
  late final MockClient mockClient;
  late final ForecastRemoteDataSource forecastRemoteDataSource;

  setUpAll(() {
    mockClient = MockClient();
    forecastRemoteDataSource = ForecastRemoteDataSourceImpl(mockClient);
    registerFallbackValue(Uri());
  });

  test(
      '[ForecastRemoteDataSourceImpl.getForecast]'
      ' returns forecast', () async {
    final json = fixtureReader.read('forecast_basic.json');
    when(() => mockClient.get(any()))
        .thenAnswer((_) async => http.Response(json, 201));

    final methodCall = forecastRemoteDataSource.getForecast;

    expect(
      await methodCall(0, 0),
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

    verify(
      () => mockClient.get(any()),
    ).called(1);
    verifyNoMoreInteractions(mockClient);
  });

  test(
      '[ForecastRemoteDataSourceImpl.getForecast]'
      ' throws [Exception]', () async {
    when(() => mockClient.get(any()))
        .thenAnswer((_) async => http.Response('{}', 500));

    final methodCall = forecastRemoteDataSource.getForecast;

    expect(
      methodCall(0, 0),
      throwsA(isA<Exception>()),
    );

    verify(
      () => mockClient.get(any()),
    ).called(1);
    verifyNoMoreInteractions(mockClient);
  });
}
