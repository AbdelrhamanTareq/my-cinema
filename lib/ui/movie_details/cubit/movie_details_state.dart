part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails data;

  const MovieDetailsLoaded(this.data);
}

class MovieDetailsGenreLoaded extends MovieDetailsState {
  final GenreDataDetails data;

  const MovieDetailsGenreLoaded(this.data);
}

class MovieDetailsError extends MovieDetailsState {
  final String error;

  const MovieDetailsError(this.error);
}
