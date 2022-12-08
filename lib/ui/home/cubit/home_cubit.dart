// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/data/models/box_office.dart';
import 'package:movies_app/data/models/coming_soon.dart';
import 'package:movies_app/data/models/genre.dart';
import 'package:movies_app/data/models/home.dart';
import 'package:movies_app/data/models/most_popular.dart';
import 'package:movies_app/data/repository/repository.dart';
import 'package:movies_app/ui/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repoistory _repoistory;
  HomeCubit(this._repoistory) : super(HomeInitState());

  getHomeData() async {
    emit(HomeLoadingState());

    var boxOfficeData = await _repoistory.getBoxOffice();

    var comingSoonData = await _repoistory.getComingSoon();
    var mostPopularTvsData = await _repoistory.getMostPopukarTvs();
    var mostPopularMoviessData = await _repoistory.getMostPopukarMovies();
    var genreData = await _repoistory.getGenre();

    late BoxOffice boxOffice;
    late MostPopular mostPopularTvs;
    late MostPopular mostPopularMovies;
    late ComingSoon comingSoon;
    late Genre genre;

    boxOfficeData.fold((error) {
      emit(HomeErrorBoxOfficeState(error.message));
      emit(HomeError(error.message));
    }, (data) => boxOffice = data);
    comingSoonData.fold((error) {
      emit(HomeErrorCommingSooneState(error.message));
      emit(HomeError(error.message));
    }, (data) => comingSoon = data);
    mostPopularTvsData.fold((error) {
      emit(HomeErrorMostPopularTvsState(error.message));
      emit(HomeError(error.message));
    }, (data) => mostPopularTvs = data);
    mostPopularMoviessData.fold((error) {
      emit(HomeErrorMostPopularMoviesState(error.message));
      emit(HomeError(error.message));
    }, (data) => mostPopularMovies = data);
    genreData.fold((error) {
      emit(HomeErrorGenreState(error.message));
      emit(HomeError(error.message));
    }, (data) => genre = data);
   

    final Home homeData = Home(
      comingSoon: comingSoon,
      boxOffice: boxOffice,
      mostPopularMovies: mostPopularMovies,
      mostPopularTvs: mostPopularTvs,
      genre: genre,
    );

    emit(HomeLoadedState(homeData));
  }
}
