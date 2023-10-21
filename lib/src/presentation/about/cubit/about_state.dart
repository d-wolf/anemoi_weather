part of 'about_cubit.dart';

sealed class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object?> get props => [];
}

class AboutStateLoading extends AboutState {
  const AboutStateLoading();
  @override
  List<Object?> get props => [];
}

class AboutStateLoaded extends AboutState {
  const AboutStateLoaded({required this.version, required this.text});

  final String version;
  final String text;

  @override
  List<Object?> get props => [version, text];
}

class AboutStateError extends AboutState {
  const AboutStateError();

  @override
  List<Object?> get props => [];
}
