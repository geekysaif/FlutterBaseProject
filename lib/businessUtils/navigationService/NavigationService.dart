import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void navigateTo(String routeName, {Object? arguments}) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static void navigateAndReplace(String routeName, {Object? arguments}) {
    navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
    }
  }

  // Navigate back and optionally pass a result
  static Future<void> goBackWithData({Object? result}) async {
    if (navigatorKey.currentState?.canPop() ?? false) {
      // Return the result when popping the screen
      navigatorKey.currentState?.pop(result);
    }
  }

  // Modify navigateTo to return a Future that will resolve when popping the screen
  static Future<dynamic> navigateAndBackRefresh(String routeName, {Object? arguments}) async {
    return await navigatorKey.currentState?.pushNamed(routeName, arguments: arguments) ?? Future.value();
  }
}