import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/injection_container.dart';
import 'package:movies_app/ui/genre_data/cubit/genre_data_cubit.dart';
import 'package:movies_app/ui/genre_data/genre_data_screen.dart';

import 'package:movies_app/ui/main_screen/cubit/main_screen_cubit.dart';
import 'package:movies_app/ui/main_screen/main_screen.dart';
import 'package:movies_app/ui/movie_details/cubit/movie_details_cubit.dart';

import 'package:movies_app/ui/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:movies_app/ui/on_boarding/on_boarding_screen.dart';
import 'package:movies_app/ui/splash/splash_screen.dart';
import '../../ui/movie_details/movie_details_screen.dart';
import '../../ui/trailer/trailer_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/on-boarding";
  static const String homePage = "/home";
  static const String movieDetails = "/movie-details";
  static const String trailer = "/trailer";
  static const String genreData = "/genre-data";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<OnBoardingCubit>(
                  create: (context) => instance<OnBoardingCubit>(),
                  child: const OnBoardingScreen(),
                ));
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<MainScreenCubit>(
                create: (_) => instance<MainScreenCubit>(),
              ),
            ],
            child: const MainScreen(),
          ),
        );
      case Routes.movieDetails:
        final Map<String, dynamic> arg =
            settings.arguments as Map<String, dynamic>;
        var id = arg["id"];
        bool isGener = arg["isGenreDetails"] ?? false;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<MovieDetailsCubit>(
                  create: (_) {
                    if (isGener) {
                      return instance<MovieDetailsCubit>()
                        ..getGenreMovieDetails(int.parse(id));
                    } else {
                      return instance<MovieDetailsCubit>()..getMovieDetails(id);
                    }
                  },
                  child: MovieDeailsScreen(),
                ));
      case Routes.trailer:
        final String link = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => TrailerScreen(link),
        );
      case Routes.genreData:
        final int id = settings.arguments as int;

        return MaterialPageRoute(
            builder: (_) => BlocProvider<GenreDataCubit>(
                  create: (_) => instance<GenreDataCubit>()..getGenreData(id),
                  child: const GenreDataScreen(),
                ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                    "No Route Found"), // todo move this string to strings manager
              ),
              body: const Center(
                  child: Text(
                      "No Route Found")), // todo move this string to strings manager
            ));
  }
}
