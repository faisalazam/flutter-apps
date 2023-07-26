import 'package:animated_splash/common-widgets/scaffold_safe_area_wrapper.dart';
import 'package:animated_splash/pages/animated-splash/animated_splash_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const String routeName = "/welcomeScreen";

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeAreaWrapper(
      child: Center(
          child: ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(AnimatedSplashPage.routeName),
              child: const Text("Go to Splash Screen"))),
    );
  }
}
