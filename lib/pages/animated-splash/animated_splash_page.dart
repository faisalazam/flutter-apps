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
          times: widget.noOfSplashLogoRepeats,
          context: context,
          onSplashAnimationEndCallback: widget.onSplashAnimationEndCallback)
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
          ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed("/"),
              child: Text("Hey"))
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
// //     appBar: AppBar(
// //       // TRY THIS: Try changing the color here to a specific color (to
// //       // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// //       // change color while the other colors stay the same.
// //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //       // Here we take the value from the MyHomePage object that was created by
// //       // the App.build method, and use it to set our appbar title.
// //       title: Text(widget.title),
// //     ),
// //     body: Center(
// //       // Center is a layout widget. It takes a single child and positions it
// //       // in the middle of the parent.
// //       child: Column(
// //         // Column is also a layout widget. It takes a list of children and
// //         // arranges them vertically. By default, it sizes itself to fit its
// //         // children horizontally, and tries to be as tall as its parent.
// //         //
// //         // Column has various properties to control how it sizes itself and
// //         // how it positions its children. Here we use mainAxisAlignment to
// //         // center the children vertically; the main axis here is the vertical
// //         // axis because Columns are vertical (the cross axis would be
// //         // horizontal).
// //         //
// //         // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// //         // action in the IDE, or press "p" in the console), to see the
// //         // wireframe for each widget.
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: <Widget>[
// //           const Text(
// //             'You have pushed the button this many times:',
// //           ),
// //           Text(
// //             '$_counter',
// //             style: Theme.of(context).textTheme.headlineMedium,
// //           ),
// //         ],
// //       ),
// //     ),
// //     floatingActionButton: FloatingActionButton(
// //       onPressed: _incrementCounter,
// //       tooltip: 'Increment',
// //       child: const Icon(Icons.add),
// //     ), // This trailing comma makes auto-formatting nicer for build methods.
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
