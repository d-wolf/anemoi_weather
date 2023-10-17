import 'package:anemoi_weather/src/core/utils/typedef.dart';

abstract class SelectedLocationRepository {
  ResultFuture<bool> exists();
  ResultFuture<void> write(int id);
  ResultFuture<int> read();
  ResultFuture<void> clear();
}
