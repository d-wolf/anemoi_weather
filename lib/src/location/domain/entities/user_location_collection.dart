import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';

class UserLocationCollection {
  String? selectedUuid;
  List<UserLocation> locations;

  bool get isEmpty => locations.isEmpty;
  bool get isNotEmpty => locations.isNotEmpty;

  UserLocation get selected =>
      locations.firstWhere((element) => element.uuid == selectedUuid);

  UserLocationCollection({
    this.selectedUuid,
    required this.locations,
  });
}
