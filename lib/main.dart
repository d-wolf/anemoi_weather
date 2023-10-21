import 'package:anemoi_weather/src/core/services/injection_container.dart';
import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:anemoi_weather/src/presentation/forecast/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/presentation/manage_locations/cubit/location_cubit.dart';
import 'package:anemoi_weather/src/presentation/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationCubit>(
          create: (context) => sl()..load(),
        ),
        BlocProvider<ForecastCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => sl()..load(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          switch (state) {
            case SettingsStateLoading():
              return const Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case SettingsStateError():
              return Material(
                child: Center(
                  child:
                      Text(AppLocalizations.of(context)!.unecpectedErrorText),
                ),
              );
            case final SettingsStateUpdate update:
              return MaterialApp(
                onGenerateTitle: (context) =>
                    AppLocalizations.of(context)!.appTitle,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.purple,
                    brightness: update.brightness,
                  ),
                  useMaterial3: true,
                ),
                onGenerateRoute: RouteGenerator.generateRoute,
                initialRoute: Routes.forecastPage,
              );
          }
        },
      ),
    );
  }
}
