import 'package:anemoi_weather/api/open_meteo/forecast/enums.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/forecast.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/remote_data_source.dart';
import 'package:anemoi_weather/pages/home.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // berlin: 52.5200° N, 13.4050° E
  final rds = RemoteDataSource();

  final data = await rds.getForecast(52.5200, 13.4050, current: [
    CurrentQueryParameters.temperature2M,
    CurrentQueryParameters.windspeed10M,
    CurrentQueryParameters.relativehumidity2M,
    CurrentQueryParameters.weathercode,
    CurrentQueryParameters.precipitation,
  ], hourly: [
    HourlyQueryParameters.temperature2M,
    HourlyQueryParameters.windspeed10M,
    HourlyQueryParameters.relativehumidity2M,
    HourlyQueryParameters.weathercode,
    HourlyQueryParameters.precipitation,
    HourlyQueryParameters.precipitationProbability,
  ]);

  runApp(MyApp(
    fc: data,
  ));
}

class MyApp extends StatelessWidget {
  final Forecast fc;

  const MyApp({required this.fc, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: HomePage(
        forecast: fc,
      ),
    );
  }
}
