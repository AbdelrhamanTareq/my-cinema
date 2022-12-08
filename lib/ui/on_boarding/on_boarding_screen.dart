import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/on_boarding.dart';
import 'package:movies_app/shared/config/routes_manger.dart';
import 'package:movies_app/shared/injection_container.dart';
import 'package:movies_app/shared/utilis/app_size.dart';
import 'package:movies_app/shared/utilis/string_manager.dart';
import 'package:movies_app/ui/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/app_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  void _goNext() {
    _controller.nextPage(
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: AppHeight.h60, left: AppWidth.w30, right: AppWidth.w30),
        //top: 60.h, left: 30.w,right: 30.w),

        child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final List<OnBoarding> onBoardingList =
                BlocProvider.of<OnBoardingCubit>(context).onBoardingList;
            int currentIndex =
                BlocProvider.of<OnBoardingCubit>(context).currentIndex;
            return PageView(
              controller: _controller,
              onPageChanged: (value) =>
                  BlocProvider.of<OnBoardingCubit>(context).changeIndex(value),
              children: onBoardingList
                  .map((item) => SingleChildScrollView(
                        child: Column(
                          children: [
                            _bulidImage(assetName: item.image),
                            _bulidTitle(context, title: item.title),
                            _buildBody(context, body: item.body),
                            SizedBox(
                              height: AppHeight.h40,
                              //height: 15.0.h,
                            ),
                            _buildNextButton(
                              () {
                                if (currentIndex == onBoardingList.length - 1) {
                                  instance<AppPreferences>().setAppHomeScreen();
                                  Navigator.pushReplacementNamed(
                                      context, Routes.homePage);
                                } else {
                                  _goNext();
                                  BlocProvider.of<OnBoardingCubit>(context)
                                      .goNext(currentIndex);
                                }
                              },
                              label: (currentIndex == onBoardingList.length - 1)
                                  ? const Text(StringManager.finish)
                                  : const Text(StringManager.next),
                            ),
                            SizedBox(
                              height: AppHeight.h30,
                              //height: 30.h,
                            ),

                            _buildDotsAndTextRow(
                              controller: _controller,
                              count: onBoardingList.length,
                              text: (currentIndex == onBoardingList.length - 1)
                                  ? StringManager.homePage
                                  : StringManager.skip,
                              onPreesed: () {
                                instance<AppPreferences>().setAppHomeScreen();
                                Navigator.pushReplacementNamed(
                                    context, Routes.homePage);
                              },
                            ),
                            //_buildDots(controller:_controller,count: _onBoardingList.length),
                          ],
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _bulidImage({required String assetName}) {
    return Image(
      image: AssetImage(assetName),
      height: AppHeight.h250,
      width: AppWidth.sw0_7,

      //height: 0.25.sh,
      fit: BoxFit.cover,
    );
  }

  Widget _bulidTitle(context, {required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppHeight.h10),
      //padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _buildBody(context, {required String body}) {
    return Container(
      width: AppWidth.sw0_75,
      //width: 300.0.w,
      padding: EdgeInsets.all(AppHeight.h10),
      //padding: EdgeInsets.all(10.0.h),
      alignment: Alignment.center,
      child: Text(
        body,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildNextButton(void Function() onPressed, {required Widget label}) {
    return SizedBox(
      width: AppWidth.sw0_25,
      //width: 120.w,
      height: AppHeight.h40,
      //height: 40.h,
      child: ElevatedButton(
          onPressed: onPressed,
          //icon: const Icon(Icons.arrow_right),
          child: label),
    );
  }

  Widget _buildDotsAndTextRow({
    required PageController controller,
    required int count,
    required String text,
    required void Function() onPreesed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmoothPageIndicator(
          controller: controller,
          count: count,
          effect: const WormEffect(),
        ),
        TextButton(
          onPressed: onPreesed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
