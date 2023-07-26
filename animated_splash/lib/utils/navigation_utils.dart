import 'dart:core';

import 'package:flutter/material.dart';

class NavigationUtils {
  static final Map<String, String> namedRouteMap = {
    'splashScreen': '/',
    'welcomeScreen': '/welcomeScreen',
  };

  static pushReplacementNamed(
      BuildContext context, String navigateToRouteName) {
    if (!NavigationUtils.namedRouteMap.containsKey(navigateToRouteName)) {
      throw Exception(
          "No route is defined for the name '$navigateToRouteName'");
    }
    Navigator.pushReplacementNamed(
        context, NavigationUtils.namedRouteMap[navigateToRouteName]!);
  }
}
