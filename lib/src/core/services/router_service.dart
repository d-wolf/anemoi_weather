import 'package:anemoi_weather/src/core/services/injection_container.dart';
import 'package:anemoi_weather/src/presentation/forecast/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/presentation/forecast/page/forecast_page.dart';
import 'package:anemoi_weather/src/presentation/manage_location/page/location_page.dart';
import 'package:anemoi_weather/src/presentation/search_location/bloc/search_bloc.dart';
import 'package:anemoi_weather/src/presentation/settings/presentation/page/settings_page.dart';
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
          builder: (_) => const ForecastPage(),
          settings: settings,
        );
      case Routes.locationPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SearchBloc>(
            create: (context) => sl(),
            child: LocationPage(
              forecastCubit: settings.arguments! as ForecastCubit,
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
