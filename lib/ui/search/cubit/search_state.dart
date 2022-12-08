part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final Search data;

  const SearchLoaded(this.data);
}

class SearchError extends SearchState {
  final String error;

  const SearchError(this.error);
}
