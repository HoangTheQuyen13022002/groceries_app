import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/models/cart.dart';
import 'package:groceries_app/models/product.dart';
import 'package:groceries_app/providers/cart_provider.dart';
import 'package:groceries_app/providers/favorite_provider.dart';
import 'package:groceries_app/widgets/button.dart';
import 'package:groceries_app/widgets/navigator.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  User? user = FirebaseAuth.instance.currentUser;
  int _currentImage = 0;
  bool _isExpanded = false;
  bool _isNutritrion = false;

  bool _isFavorite = false;
  bool _isLoading = true;
  int initialQuantity = 1;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final favoriteProvider =
    Provider.of<FavoriteProvider>(context, listen: false);
    bool isFavorite = await favoriteProvider.isFavorite(widget.product.id);
    setState(() {
      _isFavorite = isFavorite;
      _isLoading = false;
    });
  }

  Future<void> _toggleFavorite() async {
    final favoriteProvider =
    Provider.of<FavoriteProvider>(context, listen: false);
    await favoriteProvider.toggleFavorite(widget.product.id);
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void showToastMessage() =>
      Fluttertoast.showToast(
        msg: 'Add to cart success!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primaryColor,
        textColor: AppColors.whiteColor,
        fontSize: 16,
      );

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          _headerDetail(),
          _productContent(),
          Padding(
            padding:
            const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 38),
            child: Button(
                nameButton: "Add To Basket",
                buttonPressEvent: () async {
                  final cart = Cart(
                      id: Random().nextInt(1000000).toString(),
                      productId: widget.product.id,
                      quantity: initialQuantity,
                      dateCreated: DateTime.now().toString(),
                      uid: user!.uid);
                  await cartProvider.addToCart(cart);
                  Fluttertoast.showToast(
                    msg: "Add To Cart Success!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _productContent() {
    Size size = MediaQuery
        .of(context)
        .size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            try {
                              await _toggleFavorite();
                              ScaffoldMessenger.of(context);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Failed to update favorite: $e')),
                              );
                            }
                          },
                    icon: _isLoading
                        ? Icon(Icons.favorite)
                        : Icon(
                            Icons.favorite,
                            color: _isFavorite
                                ? Colors.red
                                : Colors
                                    .grey,
                          ),
                  ),
                ],
              ),
              Text(
                '${widget.product.unit}, Price',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.subtextColor,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if(initialQuantity > 1){
                                initialQuantity--;
                              }
                            });
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: const Icon(Icons.remove),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1,
                              color: AppColors.subtextColor.withOpacity(0.5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              initialQuantity.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              initialQuantity++;
                            });
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.subtextColor.withOpacity(0.5),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Product Detail",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        icon: Icon(_isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                  _isExpanded
                      ? Text(
                          widget.product.description,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.subtextColor,
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.subtextColor.withOpacity(0.5),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nutritions",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isNutritrion = !_isNutritrion;
                          });
                        },
                        icon: Icon(_isNutritrion
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                  _isNutritrion
                      ? Text(
                          widget.product.nutrients,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.subtextColor,
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.subtextColor.withOpacity(0.5),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Review",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      if (index < widget.product.star.floor()) {
                        // Hiển thị sao đầy cho các giá trị nguyên
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.asset(
                              'assets/icons/star.svg'), // Sao đầy
                        );
                      } else if (index == widget.product.star.floor() &&
                          widget.product.star % 1 >= 0.5) {
                        // Hiển thị sao một nửa nếu giá trị có phần thập phân
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.asset(
                              'assets/icons/star_half.svg'), // Sao một nửa
                        );
                      } else {
                        // Hiển thị sao rỗng
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.asset(
                              'assets/icons/star_empty.svg'), // Sao rỗng
                        );
                      }
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _headerDetail() {
  Size size = MediaQuery
      .of(context)
      .size;
  final List<String> imageUrl = List<String>.from(widget.product.images);

  return Container(
    width: double.infinity,
    height: size.height * 0.414,
    decoration: const BoxDecoration(
        color: Color(0xFFF2F3F2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
    child: Stack(
      children: [
        Positioned(
          top: 57,
          left: 25,
          child: IconButton(
            onPressed: () {
              NavigationHelper.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        Positioned(
          top: 57,
          right: 25,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/icon_share.svg'),
          ),
        ),
        Positioned(
          top: 102,
          left: 42,
          child: SizedBox(
            width: size.width * 0.79,
            height: size.height * 0.22,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _currentImage = index;
                });
              },
              itemCount: imageUrl.length,
              itemBuilder: (context, index) {
                return Image.network(
                  imageUrl[index],
                  fit: BoxFit.scaleDown,
                );
              },
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.375,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imageUrl.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Container(
                  width: _currentImage == index ? 15 : 3,
                  height: 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: _currentImage == index
                          ? AppColors.primaryColor
                          : Colors.grey),
                ),
              );
            }),
          ),
        ),
      ],
    ),
  );
}}
