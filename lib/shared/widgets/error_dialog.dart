// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies_app/shared/config/routes_manger.dart';

import 'package:movies_app/shared/utilis/app_size.dart';
import 'package:movies_app/shared/utilis/colors_manger.dart';
import 'package:movies_app/shared/utilis/string_manager.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    required this.error,
    this.retryFunciton,
  }) : super(key: key);

  final String error;
  final Function()? retryFunciton;

  @override
  Widget build(BuildContext context) {
    
    const appBarHeight = kToolbarHeight;
    const bottomNavHeight = kBottomNavigationBarHeight;
    return Container(
      width: AppWidth.sw,
      height: AppHeight.sh - appBarHeight - bottomNavHeight,
      alignment: Alignment.center,
      child: Container(
        width: AppWidth.sw0_75,
        height: AppHeight.sh0_4,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        padding: EdgeInsets.fromLTRB(
            AppWidth.w10, AppHeight.h40, AppWidth.w10, AppHeight.h2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.error_rounded,
              color: ColorManager.error,
              size: AppHeight.h100,
            ),
            Text(
              error,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: ColorManager.black),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: retryFunciton ??
                  () {
                    Navigator.pushNamed(context, Routes.movieDetails);
                  },
              child: Text(
                StringManager.retry,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: ColorManager.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
