import 'package:flutter/material.dart';
import 'package:flutter_app/screens/sign_in.dart' show SignIn;
import 'package:flutter_app/widgets/custom_text_form_field.dart';
import '../core/constants/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import "package:flutter_app/screens/home_screen.dart";
import "package:flutter_app/core/route/routing.dart";


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
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_outlined, color: Colors.white, size: 15)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0), 
              child: Image.asset('assets/images/sign_up.png', height: 450, width: 500,fit: BoxFit.cover)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 5),
              decoration: BoxDecoration(color:AppColors.secondaryColor, 
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Sign Up', color: AppColors.primaryColor, fontWeight: FontWeight.w700, fontSize: 18),
                  SizedBox(height: 12,),
                  CustomTextFormField(title: '', hintText: 'Enter your name', borderRadius: 12),
                  SizedBox(height: 12),
                  CustomTextFormField(title: '', hintText: 'Enter your email', borderRadius: 12),
                  SizedBox(height: 12),
                  CustomTextFormField(title: '', hintText: 'Password', borderRadius: 12),
                  SizedBox(height: 12),
                  CustomTextFormField(title: '', hintText: 'Confirm Password', borderRadius: 12),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.black,
                        fillColor: WidgetStateProperty.all<Color>(AppColors.secondaryColor),
                        activeColor: AppColors.primaryColor,
                        side: const BorderSide(color: Colors.black),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: CustomText(text: 'I agree to terms and conditions', 
                        color: Color(0xff5A5252), 
                        fontWeight: FontWeight.w500, 
                        fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  CustomButton(
                    onTap: () {MagicRouter.navigateReplacement(page: const HomeScreen());},
                    color: AppColors.primaryColor,
                    widget: CustomText(text: 'Sign Up', color: AppColors.secondaryColor),
                  ),
                  SizedBox(height: 13),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomText(text: 'Already have an account? ', 
                    color: Color(0xff5A5252),
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: ( _){
                          return SignIn();
                        }));
                      },
                      child: CustomText(text: 'Login', 
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
                    ),
                  ]),
                  SizedBox(height: 13),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}