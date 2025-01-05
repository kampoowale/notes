import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  static final NavigationService _instance = NavigationService._();

  NavigationService._();

  factory NavigationService() {
    return _instance;
  }

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState
            ?.pushNamed(routeName, arguments: arguments) ??
        Future.value();
  }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}
