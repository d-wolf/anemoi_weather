import 'package:anemoi_weather/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultStream<T> = Stream<T>;
typedef DataMap = Map<String, dynamic>;
