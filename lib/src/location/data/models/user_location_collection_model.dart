import 'dart:convert';

import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/data/models/user_location_model.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location_collection.dart';

class UserLocationCollectionModel extends UserLocationCollection {
  UserLocationCollectionModel({
    super.selectedUuid,
    required super.locations,
  });

  UserLocationCollectionModel.empty() : this(locations: []);

  UserLocationCollectionModel.fromDomain(UserLocationCollection collection)
      : this(
          selectedUuid: collection.selectedUuid,
          locations: collection.locations,
        );

  factory UserLocationCollectionModel.fromJson(Map<String, dynamic> json) {
    return UserLocationCollectionModel(
      selectedUuid: json.containsKey('selected_uuid')
          ? json['selected_uuid'] as String
          : null,
      locations: json.containsKey('locations')
          ? List<dynamic>.from(jsonDecode(json['locations']))
              .map((e) => UserLocationModel.fromJson(e))
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
