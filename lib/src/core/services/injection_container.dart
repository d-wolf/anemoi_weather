import 'package:anemoi_weather/src/data/forecast/datasources/forecast_remote_data_source.dart';
import 'package:anemoi_weather/src/data/forecast/repositories/forecast_repository_impl.dart';
import 'package:anemoi_weather/src/data/manage_locations/datasources/locations_local_data_source.dart';
import 'package:anemoi_weather/src/data/manage_locations/repositories/user_locations_repository_impl.dart';
import 'package:anemoi_weather/src/data/search_location/datasources/geocoding_remote_data_source.dart';
import 'package:anemoi_weather/src/data/search_location/repositories/geocoding_search_repository_impl.dart';
import 'package:anemoi_weather/src/data/settings/datasources/settings_local_data_source.dart';
import 'package:anemoi_weather/src/data/settings/repositories/settings_repository_impl.dart';
import 'package:anemoi_weather/src/domain/forecast/repositories/forecast_repository.dart';
import 'package:anemoi_weather/src/domain/forecast/usecases/fetch_forecast.dart';
import 'package:anemoi_weather/src/domain/manage_locations/repositories/user_locations_repository.dart';
import 'package:anemoi_weather/src/domain/manage_locations/usecases/add_location.dart';
import 'package:anemoi_weather/src/domain/manage_locations/usecases/delete_location.dart';
import 'package:anemoi_weather/src/domain/manage_locations/usecases/get_all_locations.dart';
import 'package:anemoi_weather/src/domain/manage_locations/usecases/select_location.dart';
import 'package:anemoi_weather/src/domain/search_location/repositories/geocoding_search_repository.dart';
import 'package:anemoi_weather/src/domain/search_location/usecases/search_location.dart';
import 'package:anemoi_weather/src/domain/settings/repositories/settings_repository.dart';
import 'package:anemoi_weather/src/domain/settings/usecases/load_settings.dart';
import 'package:anemoi_weather/src/domain/settings/usecases/save_settings.dart';
import 'package:anemoi_weather/src/presentation/forecast/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/presentation/manage_location/cubit/location_cubit.dart';
import 'package:anemoi_weather/src/presentation/search_location/bloc/search_bloc.dart';
import 'package:anemoi_weather/src/presentation/settings/presentation/cubit/settings_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('locations_key');
  await prefs.remove('settings_key');

  _initSettings();
  _initLocation();
  _initForecast();
  _initLocationSearch();

  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}

void _initSettings() {
  sl
    ..registerFactory(
      () => SettingsCubit(loadSettings: sl(), saveSettings: sl()),
    )
    ..registerLazySingleton(() => LoadSettings(sl()))
    ..registerLazySingleton(() => SaveSettings(sl()))
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(sl()),
    )
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSourceImpl(sl()),
    );
}

void _initLocation() {
  sl
    ..registerFactory(
      () => LocationCubit(
        addLocation: sl(),
        deleteLocation: sl(),
        getAllLocations: sl(),
        selectLocation: sl(),
      ),
    )
    ..registerLazySingleton(() => AddLocation(sl()))
    ..registerLazySingleton(() => DeleteLocation(sl()))
    ..registerLazySingleton(() => GetAllLocations(sl()))
    ..registerLazySingleton(() => SelectLocation(sl()))
    ..registerLazySingleton<UserLocationsRepository>(
      () => UserLocationsRepositoryImpl(sl()),
    )
    ..registerLazySingleton<UserLocationsLocalDataSource>(
      () => LocationsLocalDataSourceImpl(sl()),
    );
}

void _initForecast() {
  sl
    ..registerFactory(() => ForecastCubit(fetchForecast: sl()))
    ..registerLazySingleton(() => FetchForecast(sl()))
    ..registerLazySingleton<ForecastRepository>(
      () => ForecastRepositoryImpl(sl()),
    )
    ..registerLazySingleton<ForecastRemoteDataSource>(
      ForecastRemoteDataSourceImpl.new,
    );
}

void _initLocationSearch() {
  sl
    ..registerFactory(() => SearchBloc(searchLocation: sl()))
    ..registerLazySingleton(() => SearchLocation(sl()))
    ..registerLazySingleton<GeocodingSearchRepository>(
      () => GeocodingSearchRepositoryImpl(sl()),
    )
    ..registerLazySingleton<GeocodingRemoteDataSource>(
      GeocodingRemoteDataSourceImpl.new,
    );
}
