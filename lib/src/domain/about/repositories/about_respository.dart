import 'package:anemoi_weather/src/domain/core/types/typedef.dart';

abstract class AboutRepository {
  ResultFuture<String> getText();
  ResultFuture<String> getVersion();
}
