import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:anemoi_weather/src/core/widgets/app_drawer.dart';
import 'package:anemoi_weather/src/forecast/presentation/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/forecast/presentation/widgets/today_and_week_widget.dart';
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
    return BlocBuilder<ForecastCubit, ForecastState>(
      builder: (context, state) {
        switch (state) {
          case ForecastStateError():
            return Scaffold(
                drawer: const AppDrawer(),
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                body: Container());
          case ForecastStateLoading():
            return Scaffold(
                drawer: const AppDrawer(),
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ));
          case ForecastStateLoaded(forecast: final forecast):
            return Scaffold(
                drawer: const AppDrawer(),
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                body: TodayAndWeekWidget(
                  forecast: forecast,
                ));
        }
      },
    );
  }
}
