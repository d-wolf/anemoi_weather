import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:anemoi_weather/src/core/widgets/app_drawer.dart';
import 'package:anemoi_weather/src/forecast/presentation/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/forecast/presentation/widgets/today_and_week_widget.dart';
import 'package:anemoi_weather/src/location/presentation/cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        switch (state) {
          case LocationsStateLoaded(collection: final collection):
            context
                .read<ForecastCubit>()
                .loadForecastFromCollection(collection);
            break;
          default:
        }
      },
      child: BlocBuilder<ForecastCubit, ForecastState>(
        builder: (context, forecastState) {
          return Builder(builder: (context) {
            switch (forecastState) {
              case ForecastStateError():
                return Scaffold(
                    drawer: const AppDrawer(
                      route: Routes.forecastPage,
                    ),
                    appBar: AppBar(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                    ),
                    body: Container());
              case ForecastStateLoading():
                return Scaffold(
                    drawer: const AppDrawer(
                      route: Routes.forecastPage,
                    ),
                    appBar: AppBar(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                    ),
                    body: const Center(
                      child: CircularProgressIndicator(),
                    ));
              case ForecastStateLoaded(
                  lastUpdated: final lastUpdated,
                  userLocation: final userLocation,
                  forecast: final forecast
                ):
                return Scaffold(
                    drawer: const AppDrawer(
                      route: Routes.forecastPage,
                    ),
                    appBar: AppBar(
                      actions: [
                        IconButton(
                            onPressed: () {
                              context
                                  .read<ForecastCubit>()
                                  .loadForecast(userLocation);
                            },
                            icon: const Icon(Icons.replay))
                      ],
                      title: const Text('Forecast'),
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                    ),
                    body: TodayAndWeekWidget(
                      lastUpdated: lastUpdated,
                      userLocation: userLocation,
                      forecast: forecast,
                    ));
            }
          });
        },
      ),
    );
  }
}
