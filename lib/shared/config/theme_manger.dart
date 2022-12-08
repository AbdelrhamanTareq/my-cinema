import 'package:flutter/material.dart';
import 'package:movies_app/shared/utilis/app_size.dart';

import '../utilis/colors_manger.dart';
import '../utilis/fonts_manger.dart';
import '../utilis/styles_manger.dart';

class ThemeManger {
  ThemeManger._();

  static ThemeData getAppTheme() {
    return ThemeData(
      // main colors
      primaryColor: ColorManager.primary,

      //primaryColorLight: ColorManager.lightPrimary,
      //primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.ligthGrey,
      scaffoldBackgroundColor: ColorManager.black,
      //splashColor: ColorManager.lightPrimary,
      // ripple effect color

      // text theme

      textTheme: TextTheme(
        headline1:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s35),
        headline2:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s25),
        headline4: getLightStyle(color: ColorManager.white),
        headline5: getLightStyle(color: Colors.white),
        bodyText1:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s14),
        button: getRegularStyle(color: ColorManager.black),
        overline:
            getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s25),
            caption: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s25)
      ),

      // elevated button them
      elevatedButtonTheme: ElevatedButtonThemeData(
        
        style: ElevatedButton.styleFrom(
          //padding: EdgeInsets.zero,
          textStyle: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s16),
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r12),
          ),
        ),
      ),

      // icon theme
      iconTheme: const IconThemeData(color: ColorManager.primary),

      // input decoration theme
      inputDecorationTheme: InputDecorationTheme(

          // content padding
          contentPadding: EdgeInsets.all(AppWidth.w10),
          // hint style
          hintStyle: getRegularStyle(
              color: ColorManager.ligthGrey, fontSize: FontSize.s14),
          labelStyle: getMediumStyle(
              color: ColorManager.ligthGrey, fontSize: FontSize.s14),
          errorStyle: getRegularStyle(color: ColorManager.error),
          prefixIconColor: ColorManager.ligthGrey,
          // filled color
          filled: true,
          fillColor: ColorManager.grey,
          // enabled border style
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.grey, width: AppWidth.w1),
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.r18))),

          // focused border style
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.grey, width: AppWidth.w1),
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.r25))),

          // error border style
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.error, width: AppWidth.w1),
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.r25))),
          // focused border style
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppWidth.w1),
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.r25)))),

      /*
      // cardview theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppHeight.h4),
      // app bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppHeight.h4,
          shadowColor: ColorManager.black,
          titleTextStyle: getRegularStyle(
              fontSize: FontSize.s16, color: ColorManager.white)),
      // button theme
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.ligthGrey,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.black),

      

      
      
      // label style
      */
    );
  }
}
