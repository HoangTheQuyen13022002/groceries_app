import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/models/product.dart';
import 'package:groceries_app/widgets/product_item_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';

class ProductListSectionScreen extends StatefulWidget {
  const ProductListSectionScreen({
    super.key,
    required this.nameListSection,
  });

  final String nameListSection;

  @override
  State<ProductListSectionScreen> createState() =>
      _ProductListSectionScreenState();
}

class _ProductListSectionScreenState extends State<ProductListSectionScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 24.71),
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.34,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.nameListSection,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(right: 25.09),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.019,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productProvider.products.length,
                    itemBuilder: (content, index) {
                      Product product = productProvider.products[index];
                      return  Padding(
                        padding: const EdgeInsets.only(right: 15.05),
                        child: ProductItemScreen(product: product,),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
