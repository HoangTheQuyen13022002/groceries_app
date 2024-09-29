import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/widgets/navigator.dart';

import '../screens/detail/product_detail.dart';

class ProductItemScreen extends StatelessWidget {
  const ProductItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        NavigationHelper.navigateTo(context, const ProductDetail());
      },
      child: Container(
        width: 173.32,
        height: 248.51,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.21, left: 33.84, right: 39.27, bottom: 20.26),
              child: SizedBox(
                child: SizedBox(
                  width: 100,
                  height: 79,
                  child: Image.asset(
                    'assets/images/banana.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14.95),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height :19.99,
                    child: Text(
                      'Organic Bananas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 14,
                    child: Text(
                      '7pcs, Priceg',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.subtextColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '\$4.99',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textColor,
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 45.67,
                      height: 45.67,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primaryColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
