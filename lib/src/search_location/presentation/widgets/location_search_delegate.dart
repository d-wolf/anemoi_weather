import 'package:anemoi_weather/src/search_location/domain/entities/geocoding_search_results.dart';
import 'package:anemoi_weather/src/search_location/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SearchSelectionCallback = void Function(GeocodingSearchResult result);

class LocationSearchDelegate extends SearchDelegate {
  final SearchBloc bloc;
  final SearchSelectionCallback? searchSelectionCallback;

  LocationSearchDelegate({this.searchSelectionCallback, required this.bloc});

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
    final appLocale = Localizations.localeOf(context);
    bloc.add(
        SearchEventInput(input: query, languageCode: appLocale.languageCode));
    return _buildList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final appLocale = Localizations.localeOf(context);
    bloc.add(
        SearchEventInput(input: query, languageCode: appLocale.languageCode));
    return _buildList();
  }

  Widget _buildList() {
    return BlocProvider.value(
      value: bloc,
      child: Builder(builder: (context) {
        return BlocBuilder<SearchBloc, SearchStateUpdate>(
          builder: (context, state) {
            switch (state) {
              case SearchStateSearching():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case SearchStateUpdate(results: final results):
                return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final result = results[index];
                    return ListTile(
                      title: Text(result.name),
                      subtitle: Text('${result.country}, ${result.admin1}'),
                      onTap: () {
                        searchSelectionCallback?.call(result);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
            }
          },
        );
      }),
    );
  }
}
