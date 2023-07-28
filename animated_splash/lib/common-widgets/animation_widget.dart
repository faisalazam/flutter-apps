import 'package:animated_splash/pages/animated-splash/animation_container.dart';
import 'package:animated_splash/utils/animation_type.dart';
import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget(
      {super.key,
      this.noOfRepeats,
      this.begin,
      required this.end,
      required this.animatableWidget,
      this.onAnimationEndCallback});

  final double? begin;
  final double end;
  final int? noOfRepeats;
  final Widget animatableWidget;
  final Function? onAnimationEndCallback;

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: widget.begin ?? 0, end: widget.end)
        .animate(controller);
    if (widget.noOfRepeats == null) {
      controller.repeat(reverse: true);
    } else {
      controller
        ..repeatFor(
            context: context,
            times: widget.noOfRepeats ?? 0,
            onAnimationEndCallback: widget.onAnimationEndCallback)
        ..forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationContainer(
          animation: animation,
          animationType: AnimationType.upDown,
          animatableWidget: widget.animatableWidget),
    );
  }
}

extension on AnimationController {
  void repeatFor(
      {required int times,
      required BuildContext context,
      required Function? onAnimationEndCallback}) {
    var count = 0;
    addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (++count < times) {
          reverse();
        } else {
          if (onAnimationEndCallback != null) {
            onAnimationEndCallback(context);
          }
        }
      } else if (status == AnimationStatus.dismissed) {
        forward();
      }
    });
  }
}
