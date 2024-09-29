import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/screens/auth/login_screens.dart';
import 'package:groceries_app/widgets/navigator.dart';

import '../../constants/colors.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/onbording.png',
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: size.width * 0.5 - 25,
              top: size.height * 0.541,
              child: SvgPicture.asset('assets/icons/icon_carrot.svg'),
            ),
            Positioned(
              left: (size.width - 274) / 2,
              top: size.height * 0.643,
              child: const SizedBox(
                width: 274,
                child: Text(
                  "Welcome\n to our store",
                  style: TextStyle(
                    fontSize: 48,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.2 - 25,
              top: size.height * 0.787,
              child: const Text(
                'Ger your groceries in as fast as one hour',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.subtextColor,
                ),
              ),
            ),
            Positioned(
              left: (size.width - (size.width * 0.852)) / 2, // Centering the button
              top: size.height * 0.866,
              child: SizedBox(
                width: size.width * 0.852,
                height: 67,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                  onPressed: () {
                    NavigationHelper.navigateTo(context, const LoginScreens());
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
