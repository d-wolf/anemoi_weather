import 'package:anemoi_weather/src/core/services/injection_container.dart';
import 'package:anemoi_weather/src/core/services/router_service.dart';
import 'package:anemoi_weather/src/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_theme/system_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await SystemTheme.accentColor.load();
  final accentColor = SystemTheme.accentColor.accent;

  // final String defaultLocale = Platform.localeName.split('_').first;

  runApp(MyApp(
    sysColor: accentColor,
  ));
}

class MyApp extends StatelessWidget {
  final Color sysColor;

  const MyApp({required this.sysColor, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (context) => sl(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: sysColor, brightness: state.brightness),
              useMaterial3: true,
            ),
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: Routes.forecastPage,
          );
        },
      ),
    );
  }
}
