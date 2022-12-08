import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/models/search.dart';
import 'package:movies_app/data/repository/repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._repoistory) : super(SearchInitial());

  final Repoistory _repoistory;

  Future search(String exprission) async {
    emit(SearchLoading());
    final data = await _repoistory.search(exprission);
    data.fold(
      (error) => emit(
        SearchError(error.message),
      ),
      (data) => emit(
        SearchLoaded(data),
      ),
    );
  }
}
