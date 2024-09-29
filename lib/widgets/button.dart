import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.nameButton,
    required this.buttonPressEvent,
  });

  final String nameButton;
  final VoidCallback buttonPressEvent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 67,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: buttonPressEvent,
        child: Text(
          nameButton,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
