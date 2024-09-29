import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

final List<String> imagePath = [
  "assets/images/banner3.jpg",
  "assets/images/banner2.jpg",
  "assets/images/banner1.jpg",
];

class _BannerScreenState extends State<BannerScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < imagePath.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final height = size.height * 0.127;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          // PageView to display banners
          SizedBox(
            width: double.infinity,
            height: height,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: imagePath.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          // Dot indicator
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  imagePath.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: _currentPage == index
                          ? AppColors.primaryColor // Active dot color
                          : Colors.grey.withOpacity(0.5), // Inactive dot color
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
