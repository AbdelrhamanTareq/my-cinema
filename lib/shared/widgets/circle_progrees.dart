import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/shared/utilis/app_size.dart';
import 'package:movies_app/shared/utilis/colors_manger.dart';

class CircleProgress extends StatelessWidget {
  const CircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppWidth.sw,
      height: AppHeight.sh,
      child: Center(
        child: LoadingAnimationWidget.threeRotatingDots(
            color: ColorManager.primary, size: AppHeight.sh0_1),
      ),
    );
  }
}
