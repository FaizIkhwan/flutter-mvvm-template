import 'package:flutter/material.dart';

class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo({required String routeName, dynamic object}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: object);
  }

  void pop({dynamic result}) {
    return navigatorKey.currentState?.pop(result);
  }

  Future<dynamic>? pushAndRemoveUntil({required String newRouteName, dynamic object}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(newRouteName, (route) => false, arguments: object);
  }
}