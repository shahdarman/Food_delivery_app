import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart'; 
//import 'package:flutter_app/screens/sign_in.dart'; 
//import 'package:flutter_app/screens/splash_screen.dart'; 

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MagicRouter {
  static void navigateTo({required Widget page, bool withHistory = true}) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
      (route) => withHistory,
    );
  }

  static void navigateReplacement({required Widget page}) {
    navigatorKey.currentState?.pushReplacement(
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
    );
  }

  static void navigatePop() {
    navigatorKey.currentState?.pop();
  }

  static Widget _getPageFromRoute(String routeName) {
    switch (routeName) {
      case '/home':
        return const HomeScreen();
      default:
        return const Scaffold(
          body: Center(
            child: Text('Route not found'),
          ),
        );
    }
  }
  static void navigateToNamed(String routeName, {bool withHistory = true}) {
    final page = _getPageFromRoute(routeName);
    navigateTo(page: page, withHistory: withHistory);
  }
  static void navigateReplacementNamed(String routeName) {
    final page = _getPageFromRoute(routeName);
    navigateReplacement(page: page);
  }
}