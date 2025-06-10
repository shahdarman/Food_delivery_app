import 'package:flutter/material.dart';
import 'package:food_delivery/screens/sign_in.dart';
import 'package:food_delivery/screens/sign_up.dart';
import 'package:food_delivery/widgets/custom_button.dart';

import '../widgets/custom_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(width: double.infinity, decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/pizza.jpeg'), fit: BoxFit.cover))),
          Container(
            color: Color.fromRGBO(25, 8, 8, 0.58),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
                  child: Column(
                    children: [
                      CustomText(color: Color.fromRGBO(245, 222, 203, 1), text: 'QuickBite', fontSize: 50, fontWeight: FontWeight.w600),
                      SizedBox(height: 10),
                      CustomText(textAlign: TextAlign.center, color: Color.fromRGBO(245, 222, 203, 1),
                          text: 'Lorem ipsum dolor sit amet consectetur. Aliquam augue '
                              'sit gravida amet bibendum amet egestas.', fontSize: 12, maxLines: 5,
                          fontWeight: FontWeight.w600),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 35,
                    right: 24,
                    left: 24,
                    bottom: 30
                  ),
                  decoration: BoxDecoration(color: Color.fromRGBO(245, 222, 203, 0.35), borderRadius: BorderRadius.circular(32)),
                  child: Column(
                    children: [
                      CustomButton(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return SignIn();
                        }));
                      },
                          color: Color.fromRGBO(75, 21, 21, 1),
                          widget: CustomText(text: 'Login', color:
                          Color(0xffF5DECB))),
                      SizedBox(height: 20),
                      CustomButton(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return SignUp();
                        }));
                      }, color: Color.fromRGBO(245, 222, 203, 0.35), isBorderButton: true, borderColor: Color.fromRGBO(75, 21, 21, 1), widget: CustomText(text: 'Sign Up', color: Color.fromRGBO(75, 21, 21, 1))),
                    ],


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
