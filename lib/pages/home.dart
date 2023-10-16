import 'package:anemoi_weather/api/open_meteo/forecast/forecast.dart';
import 'package:anemoi_weather/constants/app_style.dart';
import 'package:anemoi_weather/widgets/today/today_tab_widget.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: AppStyle.spaceSmall,
          title: DropdownButton<String>(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppStyle.spaceMedium),
              elevation: 0,
              underline: const SizedBox(),
              value: 'Berlin',
              items: const [
                DropdownMenuItem(value: 'Berlin', child: Text('Berlin')),
                DropdownMenuItem(value: 'London', child: Text('London'))
              ],
              onChanged: (x) {}),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Today',
            ),
            Tab(
              text: 'Week',
            )
          ]),
        ),
        body: TabBarView(
          children: [
            TodayTabWidget(
              forecast: widget.forecast,
            ),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
