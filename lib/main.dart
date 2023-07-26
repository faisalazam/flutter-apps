import 'package:animated_splash/utils/RoutesManager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedSplashApp());
}

Size? mediaQuerySize;
const int noOfSplashLogoRepeats = 30;
const String splashLogoText = "LOGO TEXT";
const MaterialColor appMainColor = Colors.deepPurple;
const String splashLogoPath = "assets/images/vertical-eye.png";

class AnimatedSplashApp extends StatelessWidget {
  const AnimatedSplashApp({super.key});

  final String appTitle = 'Animated Splash';

  @override
  Widget build(BuildContext context) {
    if (context.mounted) {
      mediaQuerySize = MediaQuery.of(context).size;
    }
    return MaterialApp(
      title: appTitle,
      theme: buildThemeData(),
      routes: RoutesManager.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.entryPoint,
    );
  }

  ThemeData buildThemeData() => ThemeData(
        useMaterial3: true,
        primarySwatch: appMainColor,
        colorScheme: ColorScheme.fromSeed(seedColor: appMainColor),
      );
}
