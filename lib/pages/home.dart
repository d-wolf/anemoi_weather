import 'package:anemoi_weather/api/forecast/forecast.dart';
import 'package:anemoi_weather/widgets/today_tab_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Forecast forecast;

  const HomePage({super.key, required this.forecast});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.forecast.hourly!.time.take(24).toString());
    return Scaffold(
        endDrawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: TodayAndWeekWidget(
          forecast: widget.forecast,
        ));
  }
}
