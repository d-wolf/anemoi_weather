import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:anemoi_weather/src/presentation/core/widgets/app_drawer.dart';
import 'package:anemoi_weather/src/presentation/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const AppDrawer(
            route: Routes.settingsPage,
          ),
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Settings'),
          ),
          body: ListView(
            children: [
              SwitchListTile(
                title: const Text('Brightness'),
                subtitle: Text('${state.brightness}'),
                value: state.brightness.index == 0,
                onChanged: (vlaue) {
                  context.read<SettingsCubit>().switchBrightness();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
