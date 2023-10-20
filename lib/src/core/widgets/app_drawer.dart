import 'package:anemoi_weather/icons/weather_icons.dart';
import 'package:anemoi_weather/src/core/res/app_style.dart';
import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String route;
  final Map<String, Object?>? argsMap;

  const AppDrawer({required this.route, this.argsMap, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            ListTile(
              selected: route == Routes.forecastPage,
              leading: const Icon(Weather.wi_day_sunny),
              title: const Text('Forecast'),
              onTap: route == Routes.forecastPage
                  ? null
                  : () {
                      Navigator.of(context).pushNamed(Routes.forecastPage,
                          arguments: argsMap != null
                              ? argsMap![Routes.forecastPage]
                              : null);
                    },
            ),
            const DrawerItemDivider(),
            ListTile(
              selected: route == Routes.locationPage,
              leading: const Icon(Icons.location_pin),
              title: const Text('Locations'),
              onTap: route == Routes.locationPage
                  ? null
                  : () {
                      Navigator.of(context).pushNamed(Routes.locationPage,
                          arguments: argsMap != null
                              ? argsMap![Routes.locationPage]
                              : null);
                    },
            ),
            const DrawerItemDivider(),
            ListTile(
              selected: route == Routes.settingsPage,
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: route == Routes.settingsPage
                  ? null
                  : () {
                      Navigator.of(context).pushNamed(Routes.settingsPage,
                          arguments: argsMap != null
                              ? argsMap![Routes.settingsPage]
                              : null);
                    },
            ),
            const Expanded(child: SizedBox()),
            ListTile(
              selected: route == Routes.aboutPage,
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: route == Routes.aboutPage
                  ? null
                  : () {
                      Navigator.of(context).pushNamed(Routes.aboutPage,
                          arguments: argsMap != null
                              ? argsMap![Routes.aboutPage]
                              : null);
                    },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItemDivider extends StatelessWidget {
  const DrawerItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      indent: AppStyle.spaceXLarge,
      endIndent: AppStyle.spaceXLarge,
    );
  }
}
