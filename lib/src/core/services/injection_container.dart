import 'package:anemoi_weather/src/search_location/data/datasources/geocoding_remote_data_source.dart';
import 'package:anemoi_weather/src/location/data/datasources/location_local_data_source.dart';
import 'package:anemoi_weather/src/location/data/datasources/selected_location_local_data_source.dart';
import 'package:anemoi_weather/src/search_location/data/repositories/geocoding_search_repository_impl.dart';
import 'package:anemoi_weather/src/location/data/repositories/location_local_data_source.dart';
import 'package:anemoi_weather/src/location/data/repositories/selected_location_repository_impl.dart';
import 'package:anemoi_weather/src/search_location/domain/repositories/geocoding_search_repository.dart';
import 'package:anemoi_weather/src/location/domain/repositories/saved_locations_repository.dart';
import 'package:anemoi_weather/src/location/domain/repositories/selected_location_repository.dart';
import 'package:anemoi_weather/src/location/domain/usecases/get_saved_locations_or_empty.dart';
import 'package:anemoi_weather/src/location/domain/usecases/get_selected_location.dart';
import 'package:anemoi_weather/src/search_location/domain/usecases/search_location.dart';
import 'package:anemoi_weather/src/location/presentation/cubit/location_cubit.dart';
import 'package:anemoi_weather/src/search_location/presentation/bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerFactory(() => SearchBloc(searchLocation: sl()));

  sl.registerFactory(() => LocationCubit(
      getSavedLocations: sl(),
      getSelectedLocation: sl(),
      searchLocation: sl()));

  sl.registerLazySingleton(() => GetSavedLocationsOrEmpty(sl()));
  sl.registerLazySingleton(() => GetSelectedLocation(sl()));
  sl.registerLazySingleton(() => SearchLocation(sl()));

  sl.registerLazySingleton<SavedLocationsRepository>(
      () => SavedLocationsRepositoryImpl(sl()));
  sl.registerLazySingleton<SelectedLocationRepository>(
      () => SelectedLocationRepositoryImpl(sl()));
  sl.registerLazySingleton<GeocodingSearchRepository>(
      () => GeocodingSearchRepositoryImpl(sl()));

  sl.registerLazySingleton<LocationsLocalDataSource>(
      () => LocationsLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<SelectedLocationLocalDataSource>(
      () => SelectedLocationLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<GeocodingRemoteDataSource>(
      () => GeocodingRemoteDataSourceImpl());

  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}
