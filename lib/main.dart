import 'package:anemoi_weather/src/core/services/injection_container.dart';
import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:anemoi_weather/src/presentation/forecast/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/presentation/manage_location/cubit/location_cubit.dart';
import 'package:anemoi_weather/src/presentation/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_theme/system_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await SystemTheme.accentColor.load();
  final accentColor = SystemTheme.accentColor.accent;

  // final String defaultLocale = Platform.localeName.split('_').first;

  runApp(
    MyApp(
      sysColor: accentColor,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.sysColor, super.key});
  final Color sysColor;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationCubit>(
          create: (context) => sl()..loadLocations(),
        ),
        BlocProvider<ForecastCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => sl(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'ANEMOI',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: sysColor,
                brightness: state.brightness,
              ),
              useMaterial3: true,
            ),
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: Routes.forecastPage,
          );
        },
      ),
    );
  }
}
