import 'package:animated_splash/main.dart';
import 'package:flutter/material.dart';

class AnimatedSplashPage extends StatefulWidget {
  const AnimatedSplashPage({super.key, required this.title});

  final String title;
  static String routeName = "/";

  @override
  State<AnimatedSplashPage> createState() => _AnimatedSplashPageState();
}

class _AnimatedSplashPageState extends State<AnimatedSplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.deepOrange.shade50,
      // backgroundColor: appMainColor.shade50,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  // margin: EdgeInsets.only(top: controller.value),
                  child:
                      Image.asset("assets/images/vertical-eye.png", width: 60)),
            ),
            Expanded(
              child: SizedBox.expand(
                child: Text(
                  "LOGO TEXT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appMainColor.withOpacity(0.7), fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
