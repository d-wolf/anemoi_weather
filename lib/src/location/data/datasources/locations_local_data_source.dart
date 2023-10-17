import 'dart:convert';

import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/data/models/user_location_collection_model.dart';
import 'package:anemoi_weather/src/location/data/models/user_location_model.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location_collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocationsLocalDataSource {
  Future<UserLocationCollection> setSelected(UserLocation value);
  Future<UserLocationCollection> add(UserLocation value);
  UserLocationCollection getAll();
  Future<UserLocationCollection> delete(UserLocation value);
}

class LocationsLocalDataSourceImpl implements UserLocationsLocalDataSource {
  static const key = 'locations_key';

  final SharedPreferences _prefs;

  LocationsLocalDataSourceImpl(this._prefs);

  @override
  Future<UserLocationCollection> setSelected(UserLocation value) async {
    final strList = _prefs.getString(key)!;
    Map<String, dynamic> jsonList = jsonDecode(strList);
    final collection = UserLocationCollectionModel.fromJson(jsonList);
    collection.selectedUuid = value.uuid;
    final encoded = jsonEncode(collection.toJson());
    await _prefs.setString(key, encoded);
    return collection;
  }

  @override
  Future<UserLocationCollection> add(UserLocation value) async {
    final modelToAdd = UserLocationModel.fromDomain(value);
    final collection = UserLocationCollectionModel.fromDomain(getAll());
    collection.selectedUuid ??= modelToAdd.uuid;
    collection.locations.add(modelToAdd);
    final encoded = jsonEncode(collection.toJson());
    await _prefs.setString(key, encoded);
    return collection;
  }

  @override
  UserLocationCollection getAll() {
    if (!_prefs.containsKey(key)) {
      return UserLocationCollectionModel.empty();
    }

    final strList = _prefs.getString(key)!;
    DataMap jsonList = jsonDecode(strList);
    return UserLocationCollectionModel.fromJson(jsonList);
  }

  @override
  Future<UserLocationCollection> delete(UserLocation value) async {
    final strList = _prefs.getString(key)!;
    Map<String, dynamic> jsonList = jsonDecode(strList);
    final collection = UserLocationCollectionModel.fromJson(jsonList);
    final matches =
        collection.locations.where((element) => element.uuid == value.uuid);

    if (matches.isNotEmpty) {
      collection.locations.removeWhere((element) => element.uuid == value.uuid);
    }

    if (collection.locations.isEmpty) {
      collection.selectedUuid == null;
    }

    if (collection.selectedUuid == value.uuid &&
        collection.locations.isNotEmpty) {
      collection.selectedUuid = collection.locations.first.uuid;
    }

    final encoded = jsonEncode(collection.toJson());
    await _prefs.setString(key, encoded);
    return collection;
  }
}
