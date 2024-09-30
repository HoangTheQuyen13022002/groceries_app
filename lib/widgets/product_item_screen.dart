import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/models/product.dart';
import 'package:groceries_app/providers/cart_provider.dart';
import 'package:groceries_app/widgets/navigator.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../screens/detail/product_detail.dart';

class ProductItemScreen extends StatefulWidget {
  const ProductItemScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductItemScreen> createState() => _ProductItemScreenState();
}

class _ProductItemScreenState extends State<ProductItemScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;
    return GestureDetector(
      onTap: (){
        NavigationHelper.navigateTo(context, ProductDetail(product: widget.product,));
      },
      child: Container(
        width: 173.32,
        height: size.height * 0.34,
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
                  child: Image.network(
                    widget.product.images[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 14.95),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height :19.99,
                    child: Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Text(
                      widget.product.unit,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.subtextColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$${widget.product.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textColor,
                    ),
                  ),
                  Consumer<CartProvider>(builder: (context,cartProvider,child){
                    return GestureDetector(
                      onTap: (){
                        final cart = Cart(
                            id: Random().nextInt(1000000).toString(),
                            productId: widget.product.id,
                            quantity: 1,
                            dateCreated: DateTime.now().toString(),
                            uid: user!.uid);
                        setState(() {
                          cartProvider.addToCart(cart);
                        });
                      },
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
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
