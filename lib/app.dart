import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/shared/config/routes_manger.dart';
import 'package:movies_app/shared/config/theme_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
     
      builder: (BuildContext context, Widget? child) {
        return  MaterialApp(
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
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
