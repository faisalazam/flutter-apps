import 'package:animated_splash/main.dart';
import 'package:animated_splash/widgets/animated_splash_page.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static String entryPoint = AnimatedSplashPage.routeName;
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    AnimatedSplashPage.routeName: (context) => const AnimatedSplashPage(
          title: 'Flutter - Animated Splash',
          splashLogoPath: splashLogoPath,
          splashLogoText: splashLogoText,
          noOfSplashLogoRepeats: noOfSplashLogoRepeats,
        ),
  };
}
