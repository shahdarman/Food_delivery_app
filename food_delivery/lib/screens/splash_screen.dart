import 'package:flutter/material.dart';
import 'package:food_delivery/screens/welcome_screen.dart';

import '../core/route/routing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToHome();
    });
    super.initState();

  }
  _navigateToHome() async {
    await Future.delayed(
        const Duration(
          milliseconds: 3000,
        ),
            () {});
    Navigator.push(context, MaterialPageRoute(builder: (_){
      return WelcomeScreen();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(75, 21, 21, 1),
      body: Center(child: Image.asset('images/logo_image.png')),
    );
  }
}
