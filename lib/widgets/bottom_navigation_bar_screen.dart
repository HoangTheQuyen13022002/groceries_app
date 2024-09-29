import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';

import '../models/main_tab.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({
    super.key,
    required this.selectedMainTab,
    required this.onTap,
  });

  final MainTab selectedMainTab;
  final ValueChanged<MainTab> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        _onTap(index: index);
      },
      selectedLabelStyle: TextStyle(
        color: AppColors.primaryColor, // Màu cho label được chọn
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.textColor, // Màu cho label không được chọn
      ),
      items: MainTab.values
          .map((MainTab maintab) => _bottomNavigationBarItem(mainTab: maintab))
          .toList(),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({required MainTab mainTab}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(10),
        child: selectedMainTab == mainTab
            ? mainTab.selectedIcon
            : mainTab.unselectedIcon,
      ),
      label: mainTab.lable, // Chỉ cần lấy label từ mainTab
    );
  }

  void _onTap({required int index}) {
    if (index == MainTab.home.index) {
      onTap.call(MainTab.home);
    } else if (index == MainTab.explore.index) {
      onTap.call(MainTab.explore);
    } else if (index == MainTab.cart.index) {
      onTap.call(MainTab.cart);
    } else if (index == MainTab.favorite.index) {
      onTap.call(MainTab.favorite);
    } else {
      onTap.call(MainTab.profile);
    }
  }
}
