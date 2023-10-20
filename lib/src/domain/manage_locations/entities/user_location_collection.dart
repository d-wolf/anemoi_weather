import 'package:anemoi_weather/src/domain/manage_locations/entities/user_location.dart';

class UserLocationCollection {
  UserLocationCollection({
    required this.locations,
    this.selectedUuid,
  });
  final String? selectedUuid;
  final List<UserLocation> locations;

  bool get isEmpty => locations.isEmpty;
  bool get isNotEmpty => locations.isNotEmpty;

  UserLocation get selected =>
      locations.firstWhere((element) => element.uuid == selectedUuid);
}
