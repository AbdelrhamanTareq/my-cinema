part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingGoNextState extends OnBoardingState {}

class ChangeIndexState extends OnBoardingState {}
