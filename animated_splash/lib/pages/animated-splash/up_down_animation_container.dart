import 'package:flutter/material.dart';

class UpDownAnimationContainer extends AnimatedWidget {
  const UpDownAnimationContainer(
      {super.key,
      required this.animatableWidget,
      required Animation<double> animation})
      : super(listenable: animation);

  final Widget animatableWidget;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
        margin: EdgeInsets.only(top: animation.value), child: animatableWidget);
  }
}
