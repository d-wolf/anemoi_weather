import 'package:anemoi_weather/src/forecast/data/datasources/forecast_remote_data_source.dart';
import 'package:anemoi_weather/src/forecast/data/repositories/forecast_repository_impl.dart';
import 'package:anemoi_weather/src/forecast/domain/repositories/forecast_repository.dart';
import 'package:anemoi_weather/src/forecast/domain/usecases/fetch_forecast.dart';
import 'package:anemoi_weather/src/forecast/presentation/cubit/forecast_cubit.dart';
import 'package:anemoi_weather/src/location/domain/repositories/user_locations_repository.dart';
import 'package:anemoi_weather/src/location/domain/usecases/add_location.dart';
import 'package:anemoi_weather/src/location/domain/usecases/delete_location.dart';
import 'package:anemoi_weather/src/location/domain/usecases/get_all_locations.dart';
import 'package:anemoi_weather/src/location/domain/usecases/select_location.dart';
import 'package:anemoi_weather/src/search_location/data/datasources/geocoding_remote_data_source.dart';
import 'package:anemoi_weather/src/location/data/datasources/locations_local_data_source.dart';
import 'package:anemoi_weather/src/search_location/data/repositories/geocoding_search_repository_impl.dart';
import 'package:anemoi_weather/src/location/data/repositories/user_locations_repository_impl.dart';
import 'package:anemoi_weather/src/search_location/domain/repositories/geocoding_search_repository.dart';
import 'package:anemoi_weather/src/search_location/domain/usecases/search_location.dart';
import 'package:anemoi_weather/src/location/presentation/cubit/location_cubit.dart';
import 'package:anemoi_weather/src/search_location/presentation/bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('locations_key');

  sl.registerFactory(() => ForecastCubit(fetchForecast: sl()));
  sl.registerLazySingleton(() => FetchForecast(sl()));
  sl.registerLazySingleton<ForecastRepository>(
      () => ForecastRepositoryImpl(sl()));
  sl.registerLazySingleton<ForecastRemoteDataSource>(
      () => ForecastRemoteDataSourceImpl());

  sl.registerFactory(() => SearchBloc(searchLocation: sl()));

  sl.registerFactory(() => LocationCubit(
      addLocation: sl(),
      deleteLocation: sl(),
      getAllLocations: sl(),
      selectLocation: sl()));

  sl.registerLazySingleton(() => SearchLocation(sl()));

  sl.registerLazySingleton(() => AddLocation(sl()));
  sl.registerLazySingleton(() => DeleteLocation(sl()));
  sl.registerLazySingleton(() => GetAllLocations(sl()));
  sl.registerLazySingleton(() => SelectLocation(sl()));

  sl.registerLazySingleton<UserLocationsRepository>(
      () => UserLocationsRepositoryImpl(sl()));

  sl.registerLazySingleton<GeocodingSearchRepository>(
      () => GeocodingSearchRepositoryImpl(sl()));

  sl.registerLazySingleton<UserLocationsLocalDataSource>(
      () => LocationsLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<GeocodingRemoteDataSource>(
      () => GeocodingRemoteDataSourceImpl());

  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}
