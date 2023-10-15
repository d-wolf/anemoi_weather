import 'package:anemoi_weather/api/open_meteo/forecast/remote_data_source.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // berlin: 52.5200° N, 13.4050° E
  final rds = RemoteDataSource();

  final data = await rds.getForecast(52.5200, 13.4050, current: [
    CurrentOptions.temperature2m,
    CurrentOptions.windspeed_10m,
  ], hourly: [
    CurrentOptions.temperature2m,
    CurrentOptions.windspeed_10m,
  ]);

  debugPrint('${data.toJson()}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(),
    );
  }
}
