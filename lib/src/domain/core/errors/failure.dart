import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class StorageFailure extends Failure {
  const StorageFailure({required super.message});
}
