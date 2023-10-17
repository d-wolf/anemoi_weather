import 'package:anemoi_weather/src/core/utils/typedef.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';

class UserLocationModel extends UserLocation {
  UserLocationModel({
    required super.uuid,
    required super.lat,
    required super.long,
    required super.name,
    required super.tag,
  });

  UserLocationModel.fromDomain(UserLocation location)
      : this(
          lat: location.lat,
          long: location.long,
          name: location.name,
          tag: location.tag,
          uuid: location.uuid,
        );

  factory UserLocationModel.fromJson(DataMap json) => UserLocationModel(
        uuid: json['uuid'] as String,
        lat: json['lat'] as double,
        long: json['long'] as double,
        name: json['name'] as String,
        tag: json['tag'] as String,
      );

  DataMap toJson() => <String, dynamic>{
        'uuid': uuid,
        'lat': lat,
        'long': long,
        'name': name,
        'tag': tag,
      };
}
