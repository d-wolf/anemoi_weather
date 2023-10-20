import 'package:anemoi_weather/src/core/services/injection_container.dart';
import 'package:anemoi_weather/src/forecast/presentation/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/forecast/presentation/page/forecast_page.dart';
import 'package:anemoi_weather/src/location/presentation/cubit/location_cubit.dart';
import 'package:anemoi_weather/src/location/presentation/page/location_page.dart';
import 'package:anemoi_weather/src/search_location/presentation/bloc/search_bloc.dart';
import 'package:anemoi_weather/src/settings/presentation/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String forecastPage = 'forecast_page';
  static const String locationPage = 'location_page';
  static const String settingsPage = 'settings_page';
  static const String aboutPage = 'about_page';
}

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.forecastPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ForecastCubit>(
            create: (_) => sl()..reload(),
            child: const ForecastPage(),
          ),
          settings: settings,
        );
      case Routes.locationPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LocationCubit>(
            create: (_) => sl()..loadLocations(),
            child: MultiBlocProvider(
              providers: [
                BlocProvider<LocationCubit>(
                  create: (_) => sl()..loadLocations(),
                ),
                BlocProvider<SearchBloc>(
                  create: (_) => sl(),
                ),
              ],
              child: LocationPage(
                forecastCubit: settings.arguments! as ForecastCubit,
              ),
            ),
          ),
          settings: settings,
        );
      case Routes.settingsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SearchBloc>(
            create: (_) => sl(),
            child: const SettingsPage(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Text('ERROR: $settings'),
          settings: settings,
        );
    }
  }
}
