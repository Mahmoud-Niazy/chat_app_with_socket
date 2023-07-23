import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/assets_path.dart';

class SplashViewBody extends StatelessWidget{
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AssetsPath.lottieAsset),
      ],
    );
  }
}