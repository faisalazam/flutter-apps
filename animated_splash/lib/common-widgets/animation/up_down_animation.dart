import 'package:animated_splash/common-widgets/animation/animation_type.dart';
import 'package:flutter/material.dart';

class UpDownAnimation implements AnimationType {
  @override
  EdgeInsets edgeInsets(final double value) {
    return EdgeInsets.only(top: value);
  }
}
