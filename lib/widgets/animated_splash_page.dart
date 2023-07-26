import 'package:animated_splash/main.dart';
import 'package:animated_splash/widgets/animated_logo.dart';
import 'package:animated_splash/widgets/common/scaffold_safe_area_wrapper.dart';
import 'package:flutter/material.dart';

class AnimatedSplashPage extends StatefulWidget {
  const AnimatedSplashPage(
      {super.key,
      required this.title,
      required this.splashLogoPath,
      required this.splashLogoText,
      required this.noOfSplashLogoRepeats});

  final String title;
  final String splashLogoPath;
  final String splashLogoText;
  final int noOfSplashLogoRepeats;
  static const String routeName = "/";

  @override
  State<AnimatedSplashPage> createState() => _AnimatedSplashPageState();
}

class _AnimatedSplashPageState extends State<AnimatedSplashPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  static Tween<double> tween =
      Tween<double>(begin: 0, end: mediaQuerySize!.height * 0.33);

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = tween.animate(controller);
    controller
      ..repeatFor(times: widget.noOfSplashLogoRepeats, context: context)
      ..forward(from: 1); // "from: 1" to start the animation from bottom.
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeAreaWrapper(
      child: Column(
        children: [
          Expanded(
            child: AnimatedLogo(
                animation: animation, splashLogoPath: widget.splashLogoPath),
          ),
          Expanded(
            child: SizedBox.expand(
                child: Text(
              widget.splashLogoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: appMainColor.withOpacity(0.7),
                  fontSize: Theme.of(context).textTheme.displaySmall?.fontSize),
            )),
          ),
        ],
      ),
    );
  }
}

extension on AnimationController {
  void repeatFor({required int times, required BuildContext context}) {
    var count = 0;
    addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (++count < times) {
          reverse();
        }
      } else if (status == AnimationStatus.dismissed) {
        forward();
      }
    });
  }
}
