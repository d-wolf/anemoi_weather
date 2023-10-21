import 'package:anemoi_weather/src/data/about/datasources/about_data_source.dart';
import 'package:anemoi_weather/src/domain/about/repositories/about_respository.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';

class AboutRepositoryImpl implements AboutRepository {
  AboutRepositoryImpl(this._localDataSource);
  final AboutDataSource _localDataSource;

  @override
  ResultFuture<String> getText() async {
    try {
      final result = await _localDataSource.getText();
      return right(result);
    } catch (e) {
      return left(GetAboutInfoFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<String> getVersion() async {
    try {
      final result = await _localDataSource.getVersion();
      return right(result);
    } catch (e) {
      return left(GetAboutInfoFailure(message: e.toString()));
    }
  }
}
