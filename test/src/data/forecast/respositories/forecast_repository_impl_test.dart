import 'package:anemoi_weather/src/data/forecast/datasources/forecast_remote_data_source.dart';
import 'package:anemoi_weather/src/data/forecast/models/forecast_model.dart';
import 'package:anemoi_weather/src/data/forecast/repositories/forecast_repository_impl.dart';
import 'package:anemoi_weather/src/domain/core/errors/failure.dart';
import 'package:anemoi_weather/src/domain/forecast/repositories/forecast_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockForecastRemoteDataSource extends Mock
    implements ForecastRemoteDataSource {}

void main() {
  late final MockForecastRemoteDataSource mockForecastRemoteDataSource;
  late final ForecastRepository forecastRepository;

  setUpAll(() {
    mockForecastRemoteDataSource = MockForecastRemoteDataSource();
    forecastRepository = ForecastRepositoryImpl(mockForecastRemoteDataSource);
  });

  test(
      '[ForecastRemoteDataSourceImpl.getForecast]'
      ' returns [Right(ForecastModel)]', () async {
    when(() => mockForecastRemoteDataSource.getForecast(any(), any()))
        .thenAnswer(
      (_) async => const ForecastModel(
        latitude: 52.52,
        longitude: 13.419998,
        generationtimeMs: 0.0019073486328125,
        utcOffsetSeconds: 0,
        timezone: 'GMT',
        timezoneAbbreviation: 'GMT',
        elevation: 38,
      ),
    );

    final methodCall = forecastRepository.getForecast;

    expect(
      await methodCall(0, 0),
      const Right<dynamic, ForecastModel>(
        ForecastModel(
          latitude: 52.52,
          longitude: 13.419998,
          generationtimeMs: 0.0019073486328125,
          utcOffsetSeconds: 0,
          timezone: 'GMT',
          timezoneAbbreviation: 'GMT',
          elevation: 38,
        ),
      ),
    );

    verify(
      () => mockForecastRemoteDataSource.getForecast(any(), any()),
    ).called(1);
    verifyNoMoreInteractions(mockForecastRemoteDataSource);
  });

  test(
      '[ForecastRemoteDataSourceImpl.getForecast]'
      ' returns [Right(ForecastModel)]', () async {
    when(() => mockForecastRemoteDataSource.getForecast(any(), any()))
        .thenAnswer(
      (_) async => throw Exception(),
    );

    final methodCall = forecastRepository.getForecast;

    expect(
      await methodCall(0, 0),
      isA<Left<Failure, dynamic>>(),
    );

    verify(
      () => mockForecastRemoteDataSource.getForecast(any(), any()),
    ).called(1);
    verifyNoMoreInteractions(mockForecastRemoteDataSource);
  });
}
