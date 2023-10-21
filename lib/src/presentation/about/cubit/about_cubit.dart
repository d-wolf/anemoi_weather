import 'package:anemoi_weather/src/domain/about/usecases/get_text.dart';
import 'package:anemoi_weather/src/domain/about/usecases/get_version.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit({required GetVersion getVersion, required GetText getText})
      : _getVersion = getVersion,
        _getText = getText,
        super(const AboutStateLoading());

  final GetVersion _getVersion;
  final GetText _getText;

  Future<void> load() async {
    final getTextResult = await _getText();
    final getVersionResult = await _getVersion();

    getVersionResult.fold((l) => const AboutStateError(), (version) {
      getTextResult.fold(
        (l) => emit(const AboutStateError()),
        (text) => emit(AboutStateLoaded(version: version, text: text)),
      );
    });
  }
}
