import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerInitial());
}
