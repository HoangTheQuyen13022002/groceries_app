import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/constants/colors.dart';

enum MainTab { home, explore, cart, favorite, profile }

extension MainTabExtension on MainTab {
  Widget get unselectedIcon {
    switch(this) {
      case MainTab.home:
        return SvgPicture.asset('assets/icons/shop.svg');
      case MainTab.explore:
        return SvgPicture.asset('assets/icons/explore.svg');
      case MainTab.cart:
        return SvgPicture.asset('assets/icons/cart.svg');
      case MainTab.favorite:
        return SvgPicture.asset('assets/icons/favorite.svg');
      case MainTab.profile:
        return SvgPicture.asset('assets/icons/user.svg');

    }
  }

  Widget get selectedIcon {
    switch(this) {
      case MainTab.home:
        return SvgPicture.asset('assets/icons/shop.svg',color: AppColors.primaryColor,);
      case MainTab.explore:
        return SvgPicture.asset('assets/icons/explore.svg',color: AppColors.primaryColor,);
      case MainTab.cart:
        return SvgPicture.asset('assets/icons/cart.svg',color: AppColors.primaryColor,);
      case MainTab.favorite:
        return SvgPicture.asset('assets/icons/favorite.svg',color: AppColors.primaryColor,);
      case MainTab.profile:
        return SvgPicture.asset('assets/icons/user.svg',color: AppColors.primaryColor,);

    }
  }

  String get lable {
    switch(this) {
      case MainTab.home:
        return "shop";
      case MainTab.explore:
        return "Explore";
      case MainTab.cart:
        return "Cart";
      case MainTab.favorite:
        return "Favorite";
      case MainTab.profile:
        return "Account";
    }
  }
}
