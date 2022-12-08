import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/injection_container.dart';
import 'package:movies_app/ui/home/cubit/home_cubit.dart';
import 'package:movies_app/ui/home/home_screen.dart';
import 'package:movies_app/ui/search/search_screen.dart';
import 'package:movies_app/ui/settings/seetings_screen.dart';

import '../../search/cubit/search_cubit.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());

  List<Icon> icons = const [
    Icon(Icons.search),
    Icon(Icons.home),
    Icon(Icons.settings),
  ];

  List<Widget> screens = [
    
    BlocProvider<SearchCubit>(
      create: (_) => instance<SearchCubit>(),
      child: const SearchScreen(),
    ),
    BlocProvider<HomeCubit>(
      create: (_) => instance<HomeCubit>()..getHomeData(),
      child: const HomeScreen(),
    ),
    const SettingScreen(),
  ];

  int currentIndex = 1;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState(index));
    //emit(MainScreenInitial());
  }
}
