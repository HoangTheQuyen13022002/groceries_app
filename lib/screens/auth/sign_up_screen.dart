import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/screens/auth/login_screens.dart';
import 'package:groceries_app/screens/auth/widgets/form_text.dart';
import 'package:groceries_app/widgets/button.dart';

import '../../widgets/navigator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.88),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.085,
              ),
              Center(
                child: SizedBox(
                  width: 47,
                  height: 55,
                  child: Image.asset('assets/images/carrot.png'),
                ),
              ),
              SizedBox(
                height: size.height * 0.111,
              ),
              const SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 26,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter your credentials to continue",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.subtextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),

              // const FormText(
              //   nameFormText: 'Username',
              // ),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              // const FormText(
              //   nameFormText: 'Email',
              // ),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              // const FormText(
              //   nameFormText: 'Password',
              //   isPasswordField: true,
              // ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Text(
                'By continuing you agree to our Terms of Service and Privacy Policy.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.subtextColor,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Button(nameButton: 'Sign Up', buttonPressEvent: () {}),
              SizedBox(
                height: size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account?',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: (){
                      NavigationHelper.navigateTo(context, const LoginScreens());
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
