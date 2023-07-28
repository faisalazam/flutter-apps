import 'package:flutter/material.dart';

enum AnimationType {
  upDown,
  leftRight,
}

extension CatExtension on AnimationType {
  EdgeInsets edgeInsets(final double value) {
    switch (this) {
      case AnimationType.upDown:
        return EdgeInsets.only(top: value);
      case AnimationType.leftRight:
        return EdgeInsets.only(left: value);
    }
  }
}
