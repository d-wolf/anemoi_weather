import 'package:anemoi_weather/src/core/services/injection_container.dart';
import 'package:anemoi_weather/src/location/presentation/bloc/search_bloc.dart';
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
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate:
                              CustomSearchDelegate(context.read<SearchBloc>()),
                        );
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              body: const Column(
                children: [
                  Center(child: Text('HasNoSavedLocationState')),
                ],
              ),
            );
        }
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  SearchBloc _bloc;

  CustomSearchDelegate(this._bloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _bloc.add(SearchEventInput(input: query));
    return _buildList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _bloc.add(SearchEventInput(input: query));
    return _buildList();
  }

  Widget _buildList() {
    return BlocProvider.value(
      value: _bloc,
      child: Builder(builder: (context) {
        return BlocBuilder<SearchBloc, SearchStateUpdate>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.results.length,
              itemBuilder: (context, index) {
                var result = state.results[index];
                return ListTile(
                  title: Text(result.name),
                  subtitle: Text('${result.country}, ${result.admin1}'),
                  onTap: () {},
                );
              },
            );
          },
        );
      }),
    );
  }
}
