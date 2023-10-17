import 'package:anemoi_weather/src/location/presentation/cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        switch (state) {
          case LocationsLoadedState loaded:
            return Scaffold(
              appBar: AppBar(),
              body: ListView.builder(
                  itemCount: loaded.locations.length,
                  itemBuilder: (context, index) {
                    final location = loaded.locations[index];
                    return ListTile(
                      selected: location.id == loaded.selectedId,
                      title: Text(location.name),
                    );
                  }),
            );
          case ErrorLocationState():
            return Scaffold(
              appBar: AppBar(),
              body: const Center(child: Text('ERROR')),
            );
          case HasNoSavedLocationState():
            return Scaffold(
              appBar: AppBar(),
              body: const Center(child: Text('HasNoSavedLocationState')),
            );
        }
      },
    );
  }
}
