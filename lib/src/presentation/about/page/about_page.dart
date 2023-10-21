import 'package:anemoi_weather/src/presentation/about/cubit/about_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.aboutTitle),
      ),
      body: BlocBuilder<AboutCubit, AboutState>(
        builder: (context, state) {
          switch (state) {
            case AboutStateLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case final AboutStateLoaded loaded:
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Markdown(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      data: loaded.text,
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.aboutVersionLabel,
                      ),
                      subtitle: Text(loaded.version),
                      onTap: () {},
                    ),
                  ],
                ),
              );
            case AboutStateError():
              return Center(
                child: Text(AppLocalizations.of(context)!.unecpectedErrorText),
              );
          }
        },
      ),
    );
  }
}
