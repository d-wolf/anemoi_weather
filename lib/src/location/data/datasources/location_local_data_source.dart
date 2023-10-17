import 'dart:convert';

import 'package:anemoi_weather/src/location/data/models/geocoding_search_results_model.dart';
import 'package:anemoi_weather/src/location/domain/entities/geocoding_search_results.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationStore {
  static const key = 'location_key';
  final SharedPreferences _prefs;

  LocationStore(this._prefs);

  bool exists() {
    return _prefs.containsKey(key);
  }

  Future<bool> write(GeocodingSearchResult value) async {
    final model = GeocodingSearchResultModel.fromDomain(value);
    return _prefs.setString(key, jsonEncode(model.toJson()));
  }

  List<GeocodingSearchResult> read() {
    final str = _prefs.getString(key)!;
    final l = List<dynamic>.from(json.decode(str));
    final results = List<GeocodingSearchResult>.from(
        l.map((model) => GeocodingSearchResultModel.fromJson(model)));
    return results;
  }
}
