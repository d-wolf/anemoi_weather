import 'package:anemoi_weather/api/open_meteo/forecast/current/enums.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/forecast.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/hourly/enums.dart';
import 'package:anemoi_weather/api/open_meteo/forecast/remote_data_source.dart';
import 'package:anemoi_weather/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemTheme.accentColor.load();
  final accentColor = SystemTheme.accentColor.accent;

  // berlin: 52.5200° N, 13.4050° E
  final rds = RemoteDataSource();

  final data = await rds.getForecast(52.5200, 13.4050, current: [
    CurrentParameters.temperature2M,
    CurrentParameters.windspeed10M,
    CurrentParameters.relativehumidity2M,
    CurrentParameters.weathercode,
    CurrentParameters.precipitation,
  ], hourly: [
    HourlyParameters.temperature2M,
    HourlyParameters.windspeed10M,
    HourlyParameters.relativehumidity2M,
    HourlyParameters.weathercode,
    HourlyParameters.precipitation,
    HourlyParameters.precipitationProbability,
  ]);

  runApp(MyApp(
    sysColor: accentColor,
    fc: data,
  ));
}

class MyApp extends StatelessWidget {
  final Color sysColor;
  final Forecast fc;

  const MyApp({required this.sysColor, required this.fc, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: sysColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: HomePage(
        forecast: fc,
      ),
    );
  }
}
