import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/manage_locations/entities/user_location.dart';

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
        uuid: json['uuid'].toString(),
        lat: double.parse(json['lat'].toString()),
        long: double.parse(json['long'].toString()),
        name: json['name'].toString(),
        tag: json['tag'].toString(),
      );

  DataMap toJson() => <String, dynamic>{
        'uuid': uuid,
        'lat': lat,
        'long': long,
        'name': name,
        'tag': tag,
      };
}
