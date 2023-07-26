import 'package:animated_splash/utils/RoutesManager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedSplashApp());
}

const MaterialColor appMainColor = Colors.deepPurple;

class AnimatedSplashApp extends StatelessWidget {
  const AnimatedSplashApp({super.key});

  final String appTitle = 'Animated Splash';

  @override
  Widget build(BuildContext context) {
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
