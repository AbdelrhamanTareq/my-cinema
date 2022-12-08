import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/shared/utilis/colors_manger.dart';
import 'package:movies_app/ui/main_screen/cubit/main_screen_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        final MainScreenCubit provider =
            BlocProvider.of<MainScreenCubit>(context);
        final icons = provider.icons;
        final int cureentIndex = provider.currentIndex;
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              items: icons,
              backgroundColor: Colors.transparent,
              color: ColorManager.grey,
              buttonBackgroundColor: ColorManager.ligthGrey,
              index: cureentIndex,
              onTap: (index) => provider.changeIndex(index),
            ),
            body: provider.screens[cureentIndex],
          ),
        );
      },
    );
  }
}
