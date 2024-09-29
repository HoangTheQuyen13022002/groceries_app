import 'package:flutter/material.dart';
import 'package:groceries_app/screens/homes/widgets/banner_screen.dart';
import 'package:groceries_app/screens/homes/widgets/groceries.dart';
import 'package:groceries_app/screens/homes/widgets/search.dart';
import 'widgets/product_list_section_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.0647,
            ),
            Center(
              child: SizedBox(
                width: 26,
                height: 30,
                child: Image.asset('assets/images/carrot.png'),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Search(),
            ),
            SizedBox(height: size.width * 0.02,),
            SizedBox(width: (size.width - 36) ,child: const BannerScreen()),
            SizedBox(height: size.height * 0.03,),
            const ProductListSectionScreen(nameListSection: "Exclusive Offer",),
            SizedBox(height: size.height * 0.03,),
            const ProductListSectionScreen(nameListSection: "Best Selling",),
            SizedBox(height: size.height * 0.03,),
            const Groceries(),
          ],
        ),
      ),
    );
  }
}
