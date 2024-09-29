import 'package:flutter/material.dart';
import 'package:groceries_app/screens/explore/explore_screen.dart';
import 'package:groceries_app/screens/favorites/favorite_screen.dart';

import '../../models/main_tab.dart';
import '../../widgets/bottom_navigation_bar_screen.dart';
import '../carts/cart_screen.dart';
import '../profile/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainTab selectedMainTab = MainTab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(selectedMainTab),
      bottomNavigationBar: BottomNavigationBarScreen(
        selectedMainTab: selectedMainTab,
        onTap: (MainTab value) {
          setState(() {
            selectedMainTab = value;
          });
        },
      ),
    );
  }

  Widget _buildBody(MainTab tab) {
    switch (tab) {
      case MainTab.home:
        return const HomeScreen();
      case MainTab.explore:
        return ExploreScreen();
      case MainTab.cart:
        return  CartScreen();
      case MainTab.favorite:
        return const FavoriteScreen();
      case MainTab.profile:
        return ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}
