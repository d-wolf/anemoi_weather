import 'dart:convert';

import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/data/location/models/user_location_collection_model.dart';
import 'package:anemoi_weather/src/data/location/models/user_location_model.dart';
import 'package:anemoi_weather/src/domain/location/entities/user_location.dart';
import 'package:anemoi_weather/src/domain/location/entities/user_location_collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocationsLocalDataSource {
  Future<UserLocationCollection> setSelected(UserLocation value);
  Future<UserLocationCollection> add(UserLocation value);
  UserLocationCollection getAll();
  Future<UserLocationCollection> delete(UserLocation value);
  UserLocation? getSelected();
}

class LocationsLocalDataSourceImpl implements UserLocationsLocalDataSource {
  static const key = 'locations_key';

  final SharedPreferences _prefs;

  LocationsLocalDataSourceImpl(this._prefs);

  @override
  Future<UserLocationCollection> setSelected(UserLocation value) async {
    final strList = _prefs.getString(key)!;
    DataMap jsonList = jsonDecode(strList);
    final oldCollection = UserLocationCollectionModel.fromJson(jsonList);
    final newCollection = UserLocationCollectionModel(
        selectedUuid: value.uuid, locations: oldCollection.locations);
    final encoded = jsonEncode(newCollection.toJson());
    await _prefs.setString(key, encoded);
    return newCollection;
  }

  @override
  Future<UserLocationCollection> add(UserLocation value) async {
    final modelToAdd = UserLocationModel.fromDomain(value);
    final oldCollection = UserLocationCollectionModel.fromDomain(getAll());
    final newCollection = UserLocationCollectionModel(
      selectedUuid: oldCollection.selectedUuid ?? modelToAdd.uuid,
      locations: List.from(oldCollection.locations)..add(modelToAdd),
    );
    final encoded = jsonEncode(newCollection.toJson());
    await _prefs.setString(key, encoded);
    return newCollection;
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
    DataMap jsonList = jsonDecode(strList);
    final oldCollection = UserLocationCollectionModel.fromJson(jsonList);
    final locations = List<UserLocation>.from(oldCollection.locations);
    var selectedUuid = oldCollection.selectedUuid;
    final matches = locations.where((element) => element.uuid == value.uuid);

    if (matches.isNotEmpty) {
      locations.removeWhere((element) => element.uuid == value.uuid);
    }

    if (locations.isNotEmpty && selectedUuid == value.uuid) {
      selectedUuid = locations.last.uuid;
    } else if (locations.isEmpty) {
      selectedUuid = null;
    }

    final newCollection = UserLocationCollectionModel(
      selectedUuid: selectedUuid,
      locations: locations,
    );

    final encoded = jsonEncode(newCollection.toJson());
    await _prefs.setString(key, encoded);
    return newCollection;
  }

  @override
  UserLocation? getSelected() {
    final all = getAll();
    return all.isEmpty ? null : all.selected;
  }
}
