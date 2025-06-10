import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home.dart';
import 'package:food_delivery/screens/resturant.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

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
      backgroundColor: Color.fromRGBO(75, 21, 21, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_outlined, color: Colors.white, size: 15)),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30), child:
            Image.asset('images/sign_in.png')),
            SizedBox(height: 60,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 25, right: 20, left: 20, bottom: 20),
              decoration: BoxDecoration(color: Color(0xffF5DECB), borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Login', color: Color.fromRGBO(75, 21, 21, 1), fontWeight: FontWeight.w900, fontSize: 16),
   SizedBox(height: 10,),
                  CustomTextFormField(title: '', hintText: 'Enter your name', borderRadius: 12),
                  SizedBox(height: 10),
                  CustomTextFormField(title: '', hintText: 'Password', borderRadius: 12),
                  SizedBox(height: 7),
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
                      const CustomText(text: 'Remember me', color: Color(0xff5A5252), fontWeight: FontWeight.w900, fontSize: 12),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    onTap: () {
                      var push = Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen())
                      );
        
                    },
                    color: Color.fromRGBO(75, 21, 21, 1),
                    widget: CustomText(text: 'Login', color: Color(0xffF5DECB)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
