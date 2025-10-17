import 'package:flutter/material.dart';
import 'package:flutter_app/screens/sign_in.dart';
import 'package:flutter_app/screens/sign_up.dart';
import "package:flutter_app/widgets/custom_button.dart";
import '../core/constants/app_colors.dart';
import '../widgets/custom_text.dart';
import 'dart:ui';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pizza.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Color.fromRGBO(25, 8, 8, 0.58),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 220),
                  child: Column(
                    children: [
                      CustomText(
                        color: Color.fromRGBO(245, 222, 203, 1),
                        text: 'QuickBite',
                        fontSize: 55,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Instrument Sans',
                      ),
                      SizedBox(height: 10),
                      CustomText(
                        textAlign: TextAlign.center,
                        color: Color.fromRGBO(245, 222, 203, 1),
                        text: 'Lorem ipsum dolor sit amet consectetur. Aliquam augue '
                            'sit gravida amet bibendum amet egestas.',
                        fontSize: 13,
                        maxLines: 5,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), 
                    child: Container(
                      height: 228,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: 35,
                        right: 30,
                        left: 30,
                        bottom: 33,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 222, 203, 0.35), 
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        children: [
                          CustomButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => SignIn()),
                              );
                            },
                            color: AppColors.primaryColor,
                            widget: CustomText(
                              text: 'Login',
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          SizedBox(height: 35),
                          CustomButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => SignUp()),
                              );
                            },
                            color: Colors.transparent,
                            isBorderButton: true,
                            borderColor: AppColors.primaryColor,
                            widget: CustomText(
                              text: 'Sign Up',
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
