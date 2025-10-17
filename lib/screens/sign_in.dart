import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';
import "package:flutter_app/screens/home_screen.dart";
import "package:flutter_app/core/route/routing.dart";


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              icon: Icon(Icons.arrow_back_outlined, color: Colors.white, size: 15)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 5,top: 50), 
              child: Image.asset('assets/images/sign_in.png',fit: BoxFit.cover,height: 400,width: 400)
            ),
            SizedBox(height: 80),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 20),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor, 
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Login', 
                    color: AppColors.primaryColor, 
                    fontWeight: FontWeight.w700, 
                    fontSize: 18
                  ),
                  SizedBox(height: 14),
                  CustomTextFormField(title: '', hintText: 'Enter your name', borderRadius: 12),
                  SizedBox(height: 16),
                  CustomTextFormField(title: '', hintText: 'Password', borderRadius: 12),
                  SizedBox(height: 10),
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
                      const CustomText(
                        text: 'Remember me', 
                        color: Color(0xff5A5252), 
                        fontWeight: FontWeight.w500, 
                        fontSize: 14
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    onTap: () {MagicRouter.navigateReplacement(page: const HomeScreen());},
                    color: AppColors.primaryColor,
                    widget: CustomText(
                      text: 'Login', 
                      color: AppColors.secondaryColor
                    ),
                  ),
                  SizedBox(height: 75),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
