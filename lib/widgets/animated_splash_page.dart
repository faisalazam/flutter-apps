import 'package:animated_splash/main.dart';
import 'package:animated_splash/widgets/common/scaffold_safe_area_wrapper.dart';
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
      upperBound: mediaQuerySize!.height * 0.33,
      duration: const Duration(seconds: 2),
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
    return ScaffoldSafeAreaWrapper(
      child: Column(
        children: [
          Expanded(
            child: Container(
                margin: EdgeInsets.only(top: controller.value),
                child: Image.asset(widget.splashLogoPath,
                    width: mediaQuerySize!.width * 0.13)),
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
