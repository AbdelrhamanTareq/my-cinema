import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/shared/config/routes_manger.dart';
import 'package:movies_app/shared/config/theme_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        
        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(statusBarColor: Colors.black));
        return MaterialApp(
          useInheritedMediaQuery: true,
          //builder: DevicePreview.appBuilder,
          //locale: DevicePreview.locale(context),
          debugShowCheckedModeBanner: false,
          theme: ThemeManger.getAppTheme(),
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}
