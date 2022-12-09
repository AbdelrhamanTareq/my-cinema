import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_preferences.dart';
import 'package:movies_app/shared/config/routes_manger.dart';
import 'package:movies_app/shared/utilis/app_size.dart';
import 'package:movies_app/shared/utilis/assets_manager.dart';
import 'package:movies_app/shared/utilis/colors_manger.dart';
import 'package:movies_app/shared/utilis/string_manager.dart';
import '../../shared/utilis/extensions.dart';
import '../../shared/injection_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;

  final bool getAppHomeScreen = instance<AppPreferences>().getAppHomeScreen();
  _dealy() {
    _timer = Timer(const Duration(milliseconds: 2000), _goNext);
  }

  _goNext() {
    (getAppHomeScreen)
        ? Navigator.pushReplacementNamed(context, Routes.homePage)
        : Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    _dealy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondry,
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetManager.splashLogo),
            SizedBox(
              height: AppHeight.h2,
            ),
            Text(
              StringManager.myCinema,
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
