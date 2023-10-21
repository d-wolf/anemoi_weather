import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:anemoi_weather/src/presentation/core/widgets/app_drawer.dart';
import 'package:anemoi_weather/src/presentation/manage_locations/cubit/location_cubit.dart';
import 'package:anemoi_weather/src/presentation/search_location/bloc/search_bloc.dart';
import 'package:anemoi_weather/src/presentation/search_location/widgets/location_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          case final LocationsStateLoaded loaded:
            return Scaffold(
              drawer: const AppDrawer(
                route: Routes.locationPage,
              ),
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(AppLocalizations.of(context)!.locationsTitle),
                actions: [
                  IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: LocationSearchDelegate(
                          searchSelectionCallback: (result) {
                            context.read<LocationCubit>().addLocation(result);
                          },
                          bloc: context.read<SearchBloc>(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: loaded.collection.locations.length,
                itemBuilder: (context, index) {
                  final location = loaded.collection.locations[index];
                  return Dismissible(
                    key: Key(location.uuid),
                    background: Container(
                      color: Theme.of(context).colorScheme.errorContainer,
                    ),
                    onDismissed: (direction) {
                      context.read<LocationCubit>().deleteLocation(location);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context)!
                                .locationsItemDismissed(location.name),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      selected: location.uuid == loaded.collection.selectedUuid,
                      trailing: location.uuid == loaded.collection.selectedUuid
                          ? const Icon(Icons.check)
                          : const SizedBox(),
                      title: Text(location.name),
                      subtitle: Text(location.tag),
                      onTap: () {
                        context.read<LocationCubit>().selectLocation(location);
                      },
                    ),
                  );
                },
              ),
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
