import 'package:flutter/material.dart';
import 'package:flutter_app/screens/welcome_screen.dart';

import '../core/route/routing.dart';
import '../core/constants/app_colors.dart';

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
          milliseconds: 4000,
        ),
            () {});
    MagicRouter.navigateTo(page: WelcomeScreen());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Image.asset('assets/images/logo_image.png')),
    );
  }
}
