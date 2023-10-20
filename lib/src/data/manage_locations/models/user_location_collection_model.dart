import 'dart:convert';

import 'package:anemoi_weather/src/data/manage_locations/models/user_location_model.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/manage_locations/entities/user_location_collection.dart';

class UserLocationCollectionModel extends UserLocationCollection {
  UserLocationCollectionModel({
    required super.locations,
    super.selectedUuid,
  });

  UserLocationCollectionModel.empty() : this(locations: []);

  UserLocationCollectionModel.fromDomain(UserLocationCollection collection)
      : this(
          selectedUuid: collection.selectedUuid,
          locations: collection.locations,
        );

  factory UserLocationCollectionModel.fromJson(DataMap json) {
    return UserLocationCollectionModel(
      selectedUuid: json.containsKey('selected_uuid')
          ? json['selected_uuid'] as String
          : null,
      locations: json.containsKey('locations')
          ? (jsonDecode(json['locations'] as String) as List)
              .map((e) => UserLocationModel.fromJson(e as DataMap))
              .toList()
          : [],
    );
  }

  DataMap toJson() {
    final map = <String, dynamic>{
      'locations': jsonEncode(locations),
    };

    if (selectedUuid != null) {
      map['selected_uuid'] = selectedUuid;
    }

    return map;
  }
}
