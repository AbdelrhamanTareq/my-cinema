import 'package:equatable/equatable.dart';

import '../../../data/models/home.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final Home homeData;

  HomeLoadedState(this.homeData);
}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}
class HomeErrorBoxOfficeState extends HomeState {
  final String error;

  HomeErrorBoxOfficeState(this.error);
}

class HomeErrorCommingSooneState extends HomeState {
  final String error;

  HomeErrorCommingSooneState(this.error);
}

class HomeErrorMostPopularTvsState extends HomeState {
  final String error;

  HomeErrorMostPopularTvsState(this.error);
}

class HomeErrorMostPopularMoviesState extends HomeState {
  final String error;

  HomeErrorMostPopularMoviesState(this.error);
}

class HomeErrorGenreState extends HomeState {
  final String error;

  HomeErrorGenreState(this.error);
}
