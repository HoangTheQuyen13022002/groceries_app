import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/models/product.dart';
import 'package:groceries_app/providers/cart_provider.dart';
import 'package:groceries_app/widgets/button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../providers/product_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late double total;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final widthButton = MediaQuery.of(context).size.width - 50;

    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    // Fetch products if not already fetched
    if (productProvider.products.isEmpty) {
      productProvider.fetchProducts();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColors.whiteColor,
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<Cart>>(stream: cartProvider.carts, builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Đã xảy ra lỗi!'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Lottie.asset('assets/icons/cart_animation.json'));
        }

        List<Cart> carts = snapshot.data!;
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                    itemCount: carts.length,
                    itemBuilder: (context, index) {
                      Cart cart = carts[index];

                      Product? product = productProvider.products.firstWhere(
                            (product) => product.id == cart.productId,
                        orElse: () => Product(id: '', name: '', description: '', images: [],
                            nutrients: '', price: 0, unit: ''
                                '', star: 0, category: ''),
                      );

                      if (product == null) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: Center(
                              child: Text('Product not found'),
                            ),
                          ),
                        );
                      }

                      total = product.price * cart.quantity;

                      return Column(
                        children: [
                          Container(width: double.infinity,height: 0.5,color: AppColors.subtextColor.withOpacity(0.3),),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image.network(
                                         product.images[0],
                                          fit: BoxFit.scaleDown,
                                        )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Text(
                                          product.name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textColor),
                                        ),
                                         Text(
                                          product.unit,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.subtextColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        SizedBox(
                                          width: 120,
                                          height: 35,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 35,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    width: 1,
                                                    color: AppColors.subtextColor
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: IconButton(
                                                    padding: EdgeInsets.all(0),
                                                    onPressed: () {
                                                      setState(() async{
                                                        await cartProvider.decreaseQuantity(cart.productId);
                                                      });
                                                    },
                                                    splashColor: Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    icon: const Icon(Icons.remove),
                                                  ),
                                                ),
                                              ),
                                            Text(
                                                cart.quantity.toString(),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                              Container(
                                                width: 35,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    width: 1,
                                                    color: AppColors.subtextColor
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: IconButton(
                                                    padding: EdgeInsets.all(0),
                                                    onPressed: () {
                                                     setState(() async{
                                                       await cartProvider.increaseQuantity(cart.productId);
                                                     });
                                                    },
                                                    splashColor: Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    icon: const Icon(
                                                      Icons.add,
                                                      color: AppColors.primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState((){
                                            cartProvider.deleteCart(cart.productId);
                                          });
                                        }, icon: Icon(Icons.close,color: AppColors.subtextColor,)),
                                    const SizedBox(height: 16,),
                                    Text(
                                      '\$ ${total.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColor,
                                      ),
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(width: double.infinity,height: 0.5,color: AppColors.subtextColor.withOpacity(0.3),),
                        ],
                      );
                    }),
              ),
            ),
            Positioned(
              bottom: 25,
              left: (size.width - widthButton) / 2,
              child:  SizedBox(
                  width: widthButton,
                  child:
                      Button(nameButton: "Go to Checkout", buttonPressEvent: () {}),
              ),
            ),
          ],
        );
      }),
    );
  }
}
