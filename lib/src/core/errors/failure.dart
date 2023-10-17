import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class BluetoothFailure extends Failure {
  const BluetoothFailure({required super.message});
}
