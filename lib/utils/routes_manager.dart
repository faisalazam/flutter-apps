import 'package:animated_splash/main.dart';
import 'package:animated_splash/pages/animated-splash/animated_splash_page.dart';
import 'package:animated_splash/pages/welcome/welcome_page.dart';
import 'package:animated_splash/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static String entryPoint = AnimatedSplashPage.routeName;
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    AnimatedSplashPage.routeName: (context) => const AnimatedSplashPage(
        title: 'Flutter - Animated Splash',
        splashLogoPath: splashLogoPath,
        splashLogoText: splashLogoText,
        noOfSplashLogoRepeats: noOfSplashLogoRepeats,
        onSplashAnimationEndCallback: onSplashAnimationEnd),
    WelcomePage.routeName: (context) => const WelcomePage(),
  };

  static onSplashAnimationEnd(BuildContext context) {
    NavigationUtils.pushReplacementNamed(context, "welcomeScreen");
  }
}
