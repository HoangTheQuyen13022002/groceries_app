import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/models/categories.dart';
import 'package:groceries_app/models/product.dart';
import 'package:groceries_app/providers/product_provider.dart';
import 'package:groceries_app/widgets/product_item_screen.dart';
import 'package:provider/provider.dart';

import '../../../widgets/navigator.dart';

class ExploreDetail extends StatelessWidget {
  const ExploreDetail({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            NavigationHelper.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        centerTitle: true,
        title: const Text(
          'Beverages',
          style: TextStyle(
              fontSize: 20,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/filter.svg'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: GridView.builder(
          padding: const EdgeInsets.all(0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            childAspectRatio: 0.75,
          ),
          itemCount: productProvider.products.length,
          itemBuilder: (context, index) {
            if(categoryId == productProvider.products[index].category){
              return ProductItemScreen(product: productProvider.products[index],);
            }
          },
        ),
      ),
    );
  }
}
