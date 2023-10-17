import 'package:anemoi_weather/src/core/errors/failure.dart';

class GeocodingApiFailure extends Failure {
  const GeocodingApiFailure({required super.message});
}

class StorageFailure extends Failure {
  const StorageFailure({required super.message});
}
