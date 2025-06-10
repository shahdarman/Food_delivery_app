import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home.dart';
import 'package:food_delivery/screens/sign_in.dart' show SignIn;
import 'package:food_delivery/widgets/custom_text_form_field.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(75, 21, 21, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_outlined, color: Colors.white, size: 15)),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 50), child: Image.asset('images/sign_up.png')),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 19, right: 15, left: 15, bottom: 20),
              decoration: BoxDecoration(color:
              Color(0xffF5DECB), borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Sign Up', color: Color.fromRGBO(75, 21, 21, 1), fontWeight: FontWeight.w900, fontSize: 16),
                  SizedBox(height: 15),
                  CustomTextFormField(title: '', hintText: 'Enter your name', borderRadius: 12),
                  SizedBox(height: 15),
                  CustomTextFormField(title: '', hintText: 'Enter your email', borderRadius: 12),
                  SizedBox(height: 15),
                  CustomTextFormField(title: '', hintText: 'Password', borderRadius: 12),
                  SizedBox(height: 15),
                  CustomTextFormField(title: '', hintText: 'Confirm Password', borderRadius: 12),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.black,
                        fillColor: WidgetStateProperty.all<Color>(const Color(0xffF5DECB)),
                        activeColor: const Color.fromRGBO(75, 21, 21, 1),
                        side: const BorderSide(color: Colors.black),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const CustomText(text: 'I agree to terms and conditions', color: Color(0xff5A5252), fontWeight: FontWeight.w800, fontSize: 12),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return HomeScreen();
                          },
                        ),
                      );
                    },
                    color: Color.fromRGBO(75, 21, 21, 1),
                    widget: CustomText(text: 'Sign Up', color: Color(0xffF5DECB)),
                  ),
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomText(text: 'Already have an account? ', color: Color(0xff5A5252),
                        fontWeight: FontWeight.w400),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return SignIn();
                        }));
                      },
                      child: CustomText(text: 'Login', color: Color.fromRGBO(75, 21, 21, 1),
                          fontWeight: FontWeight.w900),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
