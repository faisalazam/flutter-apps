import 'package:animated_splash/main.dart';
import 'package:flutter/material.dart';

class AnimatedSplashPage extends StatefulWidget {
  const AnimatedSplashPage(
      {super.key,
      required this.title,
      required this.splashLogoPath,
      required this.splashLogoText});

  final String title;
  final String splashLogoPath;
  final String splashLogoText;
  static const String routeName = "/";

  @override
  State<AnimatedSplashPage> createState() => _AnimatedSplashPageState();
}

class _AnimatedSplashPageState extends State<AnimatedSplashPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 200,
      duration: const Duration(seconds: 1),
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: appMainColor.shade50,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: controller.value),
                  child: Image.asset(widget.splashLogoPath, width: 60)),
            ),
            Expanded(
              child: SizedBox.expand(
                  child: Text(
                widget.splashLogoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: appMainColor.withOpacity(0.7),
                    fontSize:
                        Theme.of(context).textTheme.displaySmall?.fontSize),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
