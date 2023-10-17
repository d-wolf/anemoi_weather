import 'package:anemoi_weather/src/core/widgets/app_drawer.dart';
import 'package:anemoi_weather/src/forecast/presentation/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/location/presentation/cubit/location_cubit.dart';
import 'package:anemoi_weather/src/search_location/presentation/bloc/search_bloc.dart';
import 'package:anemoi_weather/src/search_location/presentation/widgets/location_search_delegate.dart';
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
          case LocationsStateLoaded loaded:
            return Scaffold(
              drawer: const AppDrawer(),
              appBar: AppBar(
                title: const Text('Locations'),
                actions: [
                  IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: LocationSearchDelegate(
                              searchSelectionCallback: (result) {
                                context
                                    .read<LocationCubit>()
                                    .addLocation(result);
                              },
                              bloc: context.read<SearchBloc>()),
                        );
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              body: ListView.builder(
                  itemCount: loaded.collection.locations.length,
                  itemBuilder: (context, index) {
                    final location = loaded.collection.locations[index];
                    return ListTile(
                      selected: location.uuid == loaded.collection.selectedUuid,
                      trailing: location.uuid == loaded.collection.selectedUuid
                          ? const Icon(Icons.check)
                          : const SizedBox(),
                      title: Text(location.name),
                      subtitle: Text(location.tag),
                      onTap: () {
                        context.read<LocationCubit>().selectLocation(location);
                        context.read<ForecastCubit>().loadForecast(location);
                      },
                    );
                  }),
            );
          case LocationStateError():
            return Scaffold(
              appBar: AppBar(),
              body: const Center(child: Text('ERROR')),
            );
          case LocationStateLoading():
            return Scaffold(
              appBar: AppBar(),
              body: const Center(child: CircularProgressIndicator()),
            );
        }
      },
    );
  }
}
