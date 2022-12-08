import 'package:shared_preferences/shared_preferences.dart';

abstract class AppPreferences {
  bool getAppHomeScreen();
  Future setAppHomeScreen();
}

const String isOnBoardingDone = "ON_BOARDING_DONE";

class AppPreferencesImpl implements AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferencesImpl(this._sharedPreferences);

  @override
  bool getAppHomeScreen() {
    return _sharedPreferences.getBool(isOnBoardingDone) ?? false;
  }

  @override
  Future setAppHomeScreen() async {
    return await _sharedPreferences.setBool(isOnBoardingDone, true);
  }
}
