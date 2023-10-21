import 'package:anemoi_weather/src/core/services/injection_container.dart';
import 'package:anemoi_weather/src/presentation/forecast/page/forecast_page.dart';
import 'package:anemoi_weather/src/presentation/manage_locations/page/location_page.dart';
import 'package:anemoi_weather/src/presentation/search_location/bloc/search_bloc.dart';
import 'package:anemoi_weather/src/presentation/settings/presentation/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Routes {
  static const String forecastPage = 'forecast_page';
  static const String locationPage = 'location_page';
  static const String settingsPage = 'settings_page';
  static const String aboutPage = 'about_page';
}

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case Routes.forecastPage:
        builder = (_) => const ForecastPage();
      case Routes.locationPage:
        builder = (_) => BlocProvider<SearchBloc>(
              create: (_) => sl(),
              child: const LocationPage(),
            );
      case Routes.settingsPage:
        builder = (_) => BlocProvider<SearchBloc>(
              create: (_) => sl(),
              child: const SettingsPage(),
            );
      default:
        builder = (context) => Text(
              '${AppLocalizations.of(context)!.unecpectedErrorText} $settings',
            );
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
