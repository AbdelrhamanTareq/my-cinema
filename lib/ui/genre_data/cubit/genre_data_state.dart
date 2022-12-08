part of 'genre_data_cubit.dart';

abstract class GenreDataState extends Equatable {
  const GenreDataState();

  @override
  List<Object> get props => [];
}

class GenreDataInitial extends GenreDataState {}

class GenreDataLoading extends GenreDataState {}

class GenreDataLoaded extends GenreDataState {
  final Trending data;

  const GenreDataLoaded(this.data);
}

class GenreDataError extends GenreDataState {
  final String error;

  const GenreDataError(this.error);
}
