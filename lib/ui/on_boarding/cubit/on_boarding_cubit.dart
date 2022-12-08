import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/models/on_boarding.dart';
import 'package:movies_app/shared/utilis/assets_manager.dart';
import 'package:movies_app/shared/utilis/string_manager.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  List<OnBoarding> onBoardingList = [
    OnBoarding(
        image: AssetManager.onBoardingImage1,
        title: StringManager.onBardingtitle1,
        body: StringManager.onBardingbody1),
    OnBoarding(
        image: AssetManager.onBoardingImage2,
        title: StringManager.onBardingtitle2,
        body: StringManager.onBardingbody2),
    OnBoarding(
        image: AssetManager.onBoardingImage3,
        title: StringManager.onBardingtitle3,
        body: StringManager.onBardingbody3),
    OnBoarding(image: AssetManager.onBoardingImage4, title: StringManager.onBardingtitle4, body: StringManager.onBardingbody4),
  ];

  int currentIndex = 0;

  void goNext(int index) {
    if (index < onBoardingList.length) {
      currentIndex++;
    }
      emit(OnBoardingGoNextState());
  }

  void changeIndex(int index) {
    currentIndex =index;
      emit(ChangeIndexState());
  }
}
