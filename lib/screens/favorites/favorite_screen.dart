import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/providers/favorite_provider.dart';
import 'package:groceries_app/widgets/button.dart';
import 'package:provider/provider.dart';
import '../../models/favorite.dart';
import '../../models/product.dart';
import '../../providers/product_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
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
          'Favorite',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<Favorite>>(
        stream: favoriteProvider.favorite,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Đã xảy ra lỗi!'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có sản phẩm yêu thích.'));
          }

          List<Favorite> favorites = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      Favorite favorite = favorites[index];

                      // Find the matching product by productId
                      Product? product = productProvider.products.firstWhere(
                            (prod) => prod.id == favorite.productId,
                        orElse: () => Product(id: '', name: '', description: '', images: [], nutrients: '', price: 0, unit: ''
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

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    height: 56,
                                    child: Image.network(product.images[0]),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.name,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors.textColor,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                '${product.unit} / price',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.subtextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '\$${product.price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(width: double.infinity,height: 1,color: AppColors.subtextColor,),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Button(nameButton: 'Add To All Cart', buttonPressEvent: (){})
              ),
            ],
          );
        },
      ),
    );
  }
}
