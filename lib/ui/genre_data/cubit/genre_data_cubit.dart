import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/models/trending_movies.dart';
import 'package:movies_app/data/repository/repository.dart';

part 'genre_data_state.dart';

class GenreDataCubit extends Cubit<GenreDataState> {
  GenreDataCubit(this._repoistory) : super(GenreDataInitial());

  final Repoistory _repoistory;

  Future getGenreData(int id) async {
    emit(GenreDataLoading());
    final data = await _repoistory.getGenreData(id);
    data.fold((error) => emit(GenreDataError(error.message)),
        (genreData) => emit(GenreDataLoaded(genreData)));
  }
}
