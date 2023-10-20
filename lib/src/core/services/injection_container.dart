import 'package:anemoi_weather/src/data/forecast/datasources/forecast_remote_data_source.dart';
import 'package:anemoi_weather/src/data/forecast/repositories/forecast_repository_impl.dart';
import 'package:anemoi_weather/src/data/location/datasources/locations_local_data_source.dart';
import 'package:anemoi_weather/src/data/location/repositories/user_locations_repository_impl.dart';
import 'package:anemoi_weather/src/data/search_location/datasources/geocoding_remote_data_source.dart';
import 'package:anemoi_weather/src/data/search_location/repositories/geocoding_search_repository_impl.dart';
import 'package:anemoi_weather/src/domain/forecast/repositories/forecast_repository.dart';
import 'package:anemoi_weather/src/domain/forecast/usecases/fetch_forecast.dart';
import 'package:anemoi_weather/src/domain/location/repositories/user_locations_repository.dart';
import 'package:anemoi_weather/src/domain/location/usecases/add_location.dart';
import 'package:anemoi_weather/src/domain/location/usecases/delete_location.dart';
import 'package:anemoi_weather/src/domain/location/usecases/get_all_locations.dart';
import 'package:anemoi_weather/src/domain/location/usecases/select_location.dart';
import 'package:anemoi_weather/src/domain/search_location/repositories/geocoding_search_repository.dart';
import 'package:anemoi_weather/src/domain/search_location/usecases/search_location.dart';
import 'package:anemoi_weather/src/presentation/forecast/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/presentation/location/cubit/location_cubit.dart';
import 'package:anemoi_weather/src/presentation/search_location/bloc/search_bloc.dart';
import 'package:anemoi_weather/src/settings/presentation/cubit/settings_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('locations_key');

  sl.registerFactory(() => SettingsCubit());
  // TODO: settings repo/store

  sl.registerFactory(() => ForecastCubit(fetchForecast: sl()));
  sl.registerLazySingleton(() => FetchForecast(sl()));
  sl.registerLazySingleton<ForecastRepository>(
      () => ForecastRepositoryImpl(sl()));
  sl.registerLazySingleton<ForecastRemoteDataSource>(
      () => ForecastRemoteDataSourceImpl());

  sl.registerFactory(() => SearchBloc(searchLocation: sl()));
  sl.registerLazySingleton(() => SearchLocation(sl()));
  sl.registerLazySingleton<GeocodingSearchRepository>(
      () => GeocodingSearchRepositoryImpl(sl()));
  sl.registerLazySingleton<GeocodingRemoteDataSource>(
      () => GeocodingRemoteDataSourceImpl());

  sl.registerFactory(() => LocationCubit(
      addLocation: sl(),
      deleteLocation: sl(),
      getAllLocations: sl(),
      selectLocation: sl()));

  sl.registerLazySingleton(() => AddLocation(sl()));
  sl.registerLazySingleton(() => DeleteLocation(sl()));
  sl.registerLazySingleton(() => GetAllLocations(sl()));
  sl.registerLazySingleton(() => SelectLocation(sl()));
  sl.registerLazySingleton<UserLocationsRepository>(
      () => UserLocationsRepositoryImpl(sl()));
  sl.registerLazySingleton<UserLocationsLocalDataSource>(
      () => LocationsLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}
