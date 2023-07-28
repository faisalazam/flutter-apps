import 'package:animated_splash/common-widgets/animation_widget.dart';
import 'package:animated_splash/common-widgets/scaffold_safe_area_wrapper.dart';
import 'package:animated_splash/main.dart';
import 'package:flutter/material.dart';

class AnimatedSplashPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ScaffoldSafeAreaWrapper(
      child: Column(
        children: [
          AnimationWidget(
            end: mediaQuerySize!.height * 0.33,
            noOfRepeats: noOfSplashLogoRepeats,
            onAnimationEndCallback: onSplashAnimationEndCallback,
            animatableWidget: Image.asset(splashLogoPath,
                width: mediaQuerySize!.width * 0.13),
          ),
          Expanded(
            child: SizedBox.expand(
                child: Text(
              splashLogoText,
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
