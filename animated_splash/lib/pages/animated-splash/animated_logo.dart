import 'package:animated_splash/main.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo(
      {super.key,
      required this.splashLogoPath,
      required Animation<double> animation})
      : super(listenable: animation);

  final String splashLogoPath;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
        margin: EdgeInsets.only(top: animation.value),
        child:
            Image.asset(splashLogoPath, width: mediaQuerySize!.width * 0.13));
  }
}
