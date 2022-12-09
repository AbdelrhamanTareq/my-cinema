import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app.dart';
import 'package:movies_app/shared/bloc_observer.dart';
import 'package:movies_app/shared/injection_container.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  await dotenv.load(fileName: ".env");
  ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  runApp(
    //DevicePreview(
    //  enabled: !kReleaseMode,
     // builder: (context) => 
      const MyApp(),
   // ),
  );
}


