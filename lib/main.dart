import 'package:anemoi_weather/api/open_meteo/forecast/forecast.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/remote_data_source.dart';
import 'package:anemoi_weather/constants/constants.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // berlin: 52.5200° N, 13.4050° E
  final rds = RemoteDataSource();

  final data = await rds.getForecast(52.5200, 13.4050, current: [
    CurrentQueryParameters.temperature2m,
    CurrentQueryParameters.windspeed_10m,
    CurrentQueryParameters.relativehumidity_2m,
    CurrentQueryParameters.weathercode,
  ], hourly: [
    HourlyQueryParameters.temperature2m,
    HourlyQueryParameters.windspeed_10m,
    HourlyQueryParameters.relativehumidity_2m,
    HourlyQueryParameters.weathercode,
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(),
          body: Icon(Constants.wmoIconMap[fc.current!.weathercode])),
    );
  }
}
