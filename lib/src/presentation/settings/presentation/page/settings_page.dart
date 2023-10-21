import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:anemoi_weather/src/presentation/core/widgets/app_drawer.dart';
import 'package:anemoi_weather/src/presentation/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        switch (state) {
          case SettingsStateLoading():
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case SettingsStateUpdate():
            return Scaffold(
              drawer: const AppDrawer(
                route: Routes.settingsPage,
              ),
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(AppLocalizations.of(context)!.settingsTitle),
              ),
              body: ListView(
                children: [
                  SwitchListTile(
                    title: Text(
                      AppLocalizations.of(context)!.settingsBrightnessLabel,
                    ),
                    subtitle: Builder(
                      builder: (context) {
                        switch (state.brightness) {
                          case Brightness.dark:
                            return Text(
                              AppLocalizations.of(context)!
                                  .settingsBrightnessOptionDark,
                            );
                          case Brightness.light:
                            return Text(
                              AppLocalizations.of(context)!
                                  .settingsBrightnessOptionLight,
                            );
                        }
                      },
                    ),
                    value: state.brightness.index == 0,
                    onChanged: (vlaue) {
                      context.read<SettingsCubit>().switchBrightness();
                    },
                  ),
                ],
              ),
            );
          case SettingsStateError():
            return const Scaffold(
              body: Center(
                child: Text('ERROR'),
              ),
            );
        }
      },
    );
  }
}
