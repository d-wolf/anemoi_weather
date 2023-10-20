import 'package:anemoi_weather/src/domain/location/entities/user_location.dart';

class UserLocationCollection {
  final String? selectedUuid;
  final List<UserLocation> locations;

  bool get isEmpty => locations.isEmpty;
  bool get isNotEmpty => locations.isNotEmpty;

  UserLocation get selected =>
      locations.firstWhere((element) => element.uuid == selectedUuid);

  UserLocationCollection({
    this.selectedUuid,
    required this.locations,
  });
}
