import 'package:animated_splash/common-widgets/scaffold_safe_area_wrapper.dart';
import 'package:animated_splash/main.dart';
import 'package:animated_splash/pages/animated-splash/animated_logo.dart';
import 'package:flutter/material.dart';

class AnimatedSplashPage extends StatefulWidget {
  const AnimatedSplashPage(
      {super.key,
      required this.title,
      required this.splashLogoPath,
      required this.splashLogoText,
      required this.noOfSplashLogoRepeats,
      required this.onSplashAnimationEndCallback});

  final String title;
  final String splashLogoPath;
  final String splashLogoText;
  final int noOfSplashLogoRepeats;
  final Function? onSplashAnimationEndCallback;

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
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = tween.animate(controller);
    controller
      ..repeatFor(
          context: context,
          times: widget.noOfSplashLogoRepeats,
          onSplashAnimationEndCallback: widget.onSplashAnimationEndCallback)
      ..forward();
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

// // @override
// // Widget build(BuildContext context) {
// //   // This method is rerun every time setState is called, for instance as done
// //   // by the _incrementCounter method above.
// //   //
// //   // The Flutter framework has been optimized to make rerunning build methods
// //   // fast, so that you can just rebuild anything that needs updating rather
// //   // than having to individually change instances of widgets.
// //   return Scaffold(
// //     body: Center(
// //       child: Column(
// //         // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// //         // action in the IDE, or press "p" in the console), to see the
// //         // wireframe for each widget.
// //       ),
// //     ),
// //   );
// // }
// }

extension on AnimationController {
  void repeatFor(
      {required int times,
      required BuildContext context,
      required Function? onSplashAnimationEndCallback}) {
    var count = 0;
    addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (++count < times) {
          reverse();
        } else {
          onSplashAnimationEndCallback!(context);
        }
      } else if (status == AnimationStatus.dismissed) {
        forward();
      }
    });
  }
}
