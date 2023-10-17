import 'dart:convert';

import 'package:anemoi_weather/src/location/data/models/geocoding_search_results_model.dart';
import 'package:anemoi_weather/src/location/domain/entities/geocoding_search_results.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocationsLocalDataSource {
  bool exists();
  Future<bool> addOrUpdate(GeocodingSearchResult value);
  List<GeocodingSearchResult> read();
  Future<void> delete(GeocodingSearchResult value);
  Future<void> clear();
}

class LocationsLocalDataSourceImpl implements LocationsLocalDataSource {
  static const key = 'locations_key';

  final SharedPreferences _prefs;

  LocationsLocalDataSourceImpl(this._prefs);

  @override
  bool exists() {
    return _prefs.containsKey(key);
  }

  @override
  Future<bool> addOrUpdate(GeocodingSearchResult value) async {
    final model = GeocodingSearchResultModel.fromDomain(value);
    final encoded = jsonEncode(model.toJson());
    return _prefs.setString(key, encoded);
  }

  @override
  List<GeocodingSearchResult> read() {
    final str = _prefs.getString(key)!;
    final l = List<dynamic>.from(json.decode(str));
    final results = List<GeocodingSearchResult>.from(
        l.map((model) => GeocodingSearchResultModel.fromJson(model)));
    return results;
  }

  @override
  Future<void> delete(GeocodingSearchResult value) async {
    final entries = read();
    final match = entries.where((element) => element.id == value.id);

    if (match.isEmpty) {
      throw Exception('$value not found.');
    }

    entries.removeWhere((element) => element.id == value.id);
    _prefs.remove(key);

    for (var element in entries) {
      final success = await addOrUpdate(element);
      if (!success) throw Exception('Error updating data.');
    }
  }

  @override
  Future<void> clear() async {
    await _prefs.remove(key);
  }
}
