import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/models/categories.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../providers/product_provider.dart';
import '../../../widgets/product_item_screen.dart';

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Groceries",
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
            height: size.height * 0.02,
          ),
          _GroceriesCategories(),
          SizedBox(
            height: size.height * 0.019,
          ),
           SizedBox(
             height: 250,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productProvider.products.length,
                  itemBuilder: (content, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 15.05),
                      child: ProductItemScreen(product: productProvider.products[index],),
                    );
                  }),
          ),
        ],
      ),
    );
  }

  Widget _GroceriesCategories() {
    Size size = MediaQuery.of(context).size;
    final List<Categories> categories = [
      Categories(name: "Pulses", icon: "assets/images/pulses.png", id: '7'),
      Categories(name: "Rice", icon: "assets/images/rice.png", id: '8'),
    ];

    final List<Color>  catrgoryColor = [
      const Color(0xFFF8A44C).withOpacity(0.2),
      const Color(0xFF53B175).withOpacity(0.2),
    ];

    return SizedBox(
      width: double.infinity,
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                width: size.width * 0.599,
                height: size.height * 0.117,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: null,
                  color: catrgoryColor[index],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 71,
                      height: 71,
                      child: Image.asset(
                        categories[index].icon,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
