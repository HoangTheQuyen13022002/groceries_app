import 'package:flutter/material.dart';

class NavigationHelper {
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Bắt đầu từ bên phải
          const end = Offset.zero; // Kết thúc ở vị trí hiện tại
          const curve = Curves.easeInOut; // Hiệu ứng chuyển cảnh

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300), // Thời gian chuyển cảnh
      ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const SizedBox.shrink(), // Trả về widget trống
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0); // Bắt đầu từ bên trái
          const end = Offset.zero; // Kết thúc ở vị trí hiện tại
          const curve = Curves.easeInOut; // Hiệu ứng chuyển cảnh

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300), // Thời gian chuyển cảnh
      ),
    );
  }
}
