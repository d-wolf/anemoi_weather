import 'package:anemoi_weather/icons/weather_icons.dart';
import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Placeholder(
          fallbackHeight: 200,
          fallbackWidth: 200,
        ),
        ListTile(
          leading: const Icon(Weather.wi_day_sunny),
          title: const Text('Forecast'),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.homePage);
          },
        ),
        ListTile(
          leading: const Icon(Icons.location_pin),
          title: const Text('Locations'),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.locationPage);
          },
        )
      ],
    );
  }
}
