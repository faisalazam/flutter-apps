import 'package:animated_splash/utils/animation_type.dart';
import 'package:flutter/material.dart';

class AnimationContainer extends AnimatedWidget {
  const AnimationContainer(
      {super.key,
      required this.animationType,
      required this.animatableWidget,
      required Animation<double> animation})
      : super(listenable: animation);

  final Widget animatableWidget;
  final AnimationType animationType;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
        margin: animationType.edgeInsets(animation.value),
        child: animatableWidget);
  }
}
