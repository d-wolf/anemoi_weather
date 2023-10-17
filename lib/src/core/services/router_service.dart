import 'package:anemoi_weather/src/core/services/injection_container.dart';
import 'package:anemoi_weather/src/forecast/presentation/page/forecast_page.dart';
import 'package:anemoi_weather/src/location/presentation/page/location_page.dart';
import 'package:anemoi_weather/src/search_location/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String permissionsPage = 'permissions_page';
  static const String homePage = 'home_page';
  static const String locationPage = 'location_page';
  static const String aboutPage = 'location_page';
}

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.permissionsPage:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<PermissionsCubit>(
      //       create: (_) => sl(),
      //       child: const PermissionsPage(),
      //     ),
      //     settings: settings,
      //   );
      // case Routes.permissionsLegacyPage:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<PermissionsLegacyCubit>(
      //       create: (_) => sl(),
      //       child: const PermissionsLegacyPage(),
      //     ),
      //     settings: settings,
      //   );
      // case Routes.bleInitPage:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<InitBleCubit>(
      //       create: (_) => sl(),
      //       child: const InitBlePage(),
      //     ),
      //     settings: settings,
      //   );
      // case Routes.scanPage:
      //   return DismissibleDialog<void>(
      //     child: BlocProvider<BleScanCubit>(
      //       create: (_) => sl()..startScan(),
      //       child: const ScanListWidget(),
      //     ),
      //   );
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const ForecastPage(),
          settings: settings,
        );
      case Routes.locationPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SearchBloc>(
            create: (_) => sl(),
            child: const LocationPage(),
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
