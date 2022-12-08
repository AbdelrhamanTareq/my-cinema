import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/models/genre_data_details.dart';
import 'package:movies_app/data/models/movie_details.dart';
import 'package:movies_app/data/repository/repository.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this._repoistory) : super(MovieDetailsInitial());

  final Repoistory _repoistory;

  Future getMovieDetails(String id) async {
    emit(MovieDetailsLoading());

    final data = await _repoistory.getMovieDetails(id);
    data.fold(
      (error) => emit(
        MovieDetailsError(error.message),
      ),
      (data) => emit(
        MovieDetailsLoaded(data),
      ),
    );
  }

  Future getGenreMovieDetails(int id) async {
    emit(MovieDetailsLoading());
    

    final data = await _repoistory.getGenreDataDetails(id);
    data.fold(
      (error) => emit(
        MovieDetailsError(error.message),
      ),
      (data) => emit(
        MovieDetailsGenreLoaded(data),
      ),
    );
  }
}
