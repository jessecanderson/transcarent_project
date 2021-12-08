import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({Key? key, required this.animation}) : super(key: key);

  final String animation;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('lib/assets/lottie/$animation.json');
  }
}
