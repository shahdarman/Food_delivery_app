import 'package:flutter/material.dart';
import 'package:flutter_app/screens/splash_screen.dart';
import 'core/route/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      builder: (context, child) {
        return MediaQuery.removePadding(
          context: context,
          removeRight: true,
          child: child!,
        );
      },
      home: const SplashScreen(),
    );
  }
}