import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/screens/auth/sign_up_screen.dart';
import 'package:groceries_app/screens/auth/widgets/form_text.dart';
import 'package:groceries_app/screens/homes/main_screen.dart';
import 'package:groceries_app/widgets/button.dart';
import 'package:provider/provider.dart';
import '../../widgets/navigator.dart';
import '../../providers/auth_provider.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProviders>(context);
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
                      "Loging",
                      style: TextStyle(
                          fontSize: 26,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter your emails and password",
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
              FormText(
                textEditingController: _emailController,
                nameFormText: 'Email',
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              FormText(
                textEditingController: _passwordController,
                nameFormText: 'Password',
                isPasswordField: true,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Button(nameButton: 'Log In', buttonPressEvent: () async{
                try{
                  await authProvider.signIn(_emailController.text, _passwordController.text);
                  NavigationHelper.navigateTo(context, MainScreen());
                } catch(e){
                  print(e);
                }
              }),
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
                      NavigationHelper.navigateTo(context, const SignUpScreen());
                    },
                    child: const Text(
                      'Signup',
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
