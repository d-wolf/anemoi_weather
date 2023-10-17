import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        endDrawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Locations'),
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.locationPage);
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Container());
  }
}
