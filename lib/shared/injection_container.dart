import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_app/data/data_source/remote_data_source.dart';

import 'package:movies_app/data/network/app_api.dart';
import 'package:movies_app/data/network/dio_factory.dart';
import 'package:movies_app/data/network/network_info.dart';
import 'package:movies_app/data/repository/repository.dart';
import 'package:movies_app/shared/app_preferences.dart';
import 'package:movies_app/ui/genre_data/cubit/genre_data_cubit.dart';

import 'package:movies_app/ui/home/cubit/home_cubit.dart';
import 'package:movies_app/ui/main_screen/cubit/main_screen_cubit.dart';
import 'package:movies_app/ui/movie_details/cubit/movie_details_cubit.dart';

import 'package:movies_app/ui/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:movies_app/ui/search/cubit/search_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt instance = GetIt.instance;

Future<void> initDI() async {
  // remote data source
  instance.registerLazySingleton<RemoteDataSourec>(
      () => RemoteDataSourecImpl(instance(), instance()));

  // repo
  instance.registerLazySingleton<Repoistory>(
      () => RepoistoryImpl(instance(), instance()));

  //API
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await instance<DioFactory>().initDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance
      .registerLazySingleton<AppServiceClient1>(() => AppServiceClient1(dio));

  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  instance.registerLazySingleton<InternetConnectionChecker>(
      () => internetConnectionChecker);

  instance
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(instance()));

  // app prefs
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferencesImpl(instance()));

  // Bloc
  instance.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
  instance.registerFactory<HomeCubit>(() => HomeCubit(instance()));
  instance.registerFactory<MainScreenCubit>(() => MainScreenCubit());
  instance.registerFactory<SearchCubit>(() => SearchCubit(instance()));
  instance
      .registerFactory<MovieDetailsCubit>(() => MovieDetailsCubit(instance()));
  instance.registerFactory<GenreDataCubit>(() => GenreDataCubit(instance()));
}
