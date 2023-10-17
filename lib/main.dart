import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';

late final SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await SystemTheme.accentColor.load();
  final accentColor = SystemTheme.accentColor.accent;

  // berlin: 52.5200° N, 13.4050° E
  // final fcDataSource = ForecastRemoteDataSource();
  // final geoDataSource = GeocodingRemoteDataSource();

  // final String defaultLocale = Platform.localeName.split('_').first;
  // final result = geoDataSource.search('Ber', 10, defaultLocale);

  // final data = await fcDataSource.getForecast(52.5200, 13.4050, current: [
  //   CurrentParameters.temperature2M,
  //   CurrentParameters.windspeed10M,
  //   CurrentParameters.relativehumidity2M,
  //   CurrentParameters.weathercode,
  //   CurrentParameters.precipitation,
  // ], hourly: [
  //   HourlyParameters.temperature2M,
  //   HourlyParameters.windspeed10M,
  //   HourlyParameters.relativehumidity2M,
  //   HourlyParameters.weathercode,
  //   HourlyParameters.precipitation,
  //   HourlyParameters.precipitationProbability,
  // ]);

  runApp(MyApp(
    sysColor: accentColor,
  ));
}

class MyApp extends StatelessWidget {
  final Color sysColor;

  const MyApp({required this.sysColor, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: sysColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.homePage,
    );
  }
}
