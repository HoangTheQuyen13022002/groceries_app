import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/models/categories.dart';
import 'package:groceries_app/screens/explore/screens/explore_detail.dart';
import 'package:groceries_app/widgets/navigator.dart';

import '../homes/widgets/search.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<Categories> categories = [
      Categories(
          name: "Frash Fruits & Vegetable",
          icon: "assets/images/category1.png"),
      Categories(
          name: "Cooking Oil & Ghee", icon: "assets/images/category2.png"),
      Categories(name: "Meat & Fish", icon: "assets/images/category3.png"),
      Categories(name: "Bakery & Snacks", icon: "assets/images/category4.png"),
      Categories(name: "Dairy & Eggs", icon: "assets/images/category5.png"),
      Categories(name: "Beverages", icon: "assets/images/category6.png"),
      Categories(name: "Rice", icon: "assets/images/rice.png"),
      Categories(name: "Pulses", icon: "assets/images/pulses.png"),
    ];

    final List<Map<String, Color>> categoryColors = [
      {'color': const Color(0xFF53B175).withOpacity(0.2), 'border': const Color(0xFF53B175)},
      {'color': const Color(0xFFF8A44C).withOpacity(0.2), 'border': const Color(0xFFF8A44C)},
      {'color': const Color(0xFFF7A593).withOpacity(0.2), 'border': const Color(0xFFF7A593)},
      {'color': const Color(0xFFD3B0E0).withOpacity(0.2), 'border': const Color(0xFFD3B0E0)},
      {'color': const Color(0xFFFDE598).withOpacity(0.2), 'border': const Color(0xFFFDE598)},
      {'color': const Color(0xFFB7DFF5).withOpacity(0.2), 'border': const Color(0xFFB7DFF5)},
      {'color': const Color(0xFF836AF6).withOpacity(0.2), 'border': const Color(0xFF836AF6)},
      {'color': const Color(0xFFD73B77).withOpacity(0.2), 'border': const Color(0xFFD73B77)},
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.056,
            ),
            const Center(
              child: Text(
                'Find Products',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Search(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      NavigationHelper.navigateTo(context, ExploreDetail());
                    },
                    child: Container(
                      width: size.width * 0.42,
                      height: size.height * 0.21,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: categoryColors[index]['color'],
                        border: Border.all(
                          width: 1,
                          color: categoryColors[index]['border']!,
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 27,
                          ),
                          Center(
                            child: SizedBox(
                              width: 111,
                              height: 74,
                              child: Image.asset(
                                categories[index].icon,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            categories[index].name,
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
