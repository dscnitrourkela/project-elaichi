import 'package:flutter/material.dart';

/// Navigation Service for the app.
class NavigationService {
  /// Global navigator key for the app.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName,
    RoutePredicate route, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      route,
      arguments: arguments,
    );
  }

  void pop() {
    return navigatorKey.currentState!.pop();
  }

  NavigatorState get navigatorState => navigatorKey.currentState!;
}
