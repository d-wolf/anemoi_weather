import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:anemoi_weather/src/presentation/core/widgets/app_drawer.dart';
import 'package:anemoi_weather/src/presentation/forecast/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/presentation/forecast/widgets/today_and_week_widget.dart';
import 'package:anemoi_weather/src/presentation/manage_locations/cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        switch (state) {
          case LocationStateLoading():
            break;
          case LocationsStateLoaded(collection: final collection):
            context.read<ForecastCubit>().load(collection);
          case LocationStateError():
            break;
        }
      },
      builder: (context, state) {
        return BlocBuilder<ForecastCubit, ForecastState>(
          builder: (context, forecastState) {
            return Builder(
              builder: (context) {
                switch (forecastState) {
                  case ForecastStateError():
                    return Scaffold(
                      drawer: AppDrawer(
                        route: Routes.forecastPage,
                        argsMap: {
                          Routes.locationPage: context.read<ForecastCubit>(),
                        },
                      ),
                      appBar: AppBar(
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                      ),
                      body: Container(),
                    );
                  case ForecastStateLoading():
                    return Scaffold(
                      drawer: AppDrawer(
                        route: Routes.forecastPage,
                        argsMap: {
                          Routes.locationPage: context.read<ForecastCubit>(),
                        },
                      ),
                      appBar: AppBar(
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                      ),
                      body: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case ForecastStateLoaded(
                      lastUpdated: final lastUpdated,
                      userLocation: final userLocation,
                      forecast: final forecast
                    ):
                    return Scaffold(
                      drawer: AppDrawer(
                        route: Routes.forecastPage,
                        argsMap: {
                          Routes.locationPage: context.read<ForecastCubit>(),
                        },
                      ),
                      appBar: AppBar(
                        actions: [
                          IconButton(
                            onPressed: () {
                              context.read<ForecastCubit>().reload();
                            },
                            icon: const Icon(Icons.replay),
                          ),
                        ],
                        title:
                            Text(AppLocalizations.of(context)!.forecastTitle),
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                      ),
                      body: TodayAndWeekWidget(
                        lastUpdated: lastUpdated,
                        userLocation: userLocation,
                        forecast: forecast,
                      ),
                    );
                  case ForecastStateNoLocation():
                    return Scaffold(
                      drawer: AppDrawer(
                        route: Routes.forecastPage,
                        argsMap: {
                          Routes.locationPage: context.read<ForecastCubit>(),
                        },
                      ),
                      appBar: AppBar(
                        actions: [
                          IconButton(
                            onPressed: () {
                              context.read<ForecastCubit>().reload();
                            },
                            icon: const Icon(Icons.replay),
                          ),
                        ],
                        title:
                            Text(AppLocalizations.of(context)!.forecastTitle),
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                      ),
                      body: Center(
                        child: Text(
                          AppLocalizations.of(context)!
                              .locationsNoLocationSelected,
                        ),
                      ),
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
