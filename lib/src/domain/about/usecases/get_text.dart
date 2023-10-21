import 'package:anemoi_weather/src/domain/about/repositories/about_respository.dart';
import 'package:anemoi_weather/src/domain/core/types/typedef.dart';
import 'package:anemoi_weather/src/domain/core/usecase/usecase.dart';

class GetText extends UsecaseWithoutParams<String> {
  GetText(this._repo);
  final AboutRepository _repo;

  @override
  ResultFuture<String> call() async {
    return _repo.getText();
  }
}
