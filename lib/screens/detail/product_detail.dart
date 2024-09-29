import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/widgets/button.dart';
import 'package:groceries_app/widgets/navigator.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _currentImage = 0;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _headerDetail(),
          _productContent(),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 38),
            child: Button(nameButton: "Add To Basket", buttonPressEvent: () {}),
          ),
        ],
      ),
    );
  }

  Widget _productContent() {
    Size size = MediaQuery.of(context).size;
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
                  const Text(
                    'Naturel Red Apple',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined))
                ],
              ),
              const Text(
                '1kg, Price',
                style: TextStyle(
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
                          onPressed: () {},
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
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
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
                  const Text(
                    '\$4.99',
                    style: TextStyle(
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
                      ? const Text(
                          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet. Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                          style: TextStyle(
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
                    "Nutritions",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: const Color(0xFFE4E4E4),
                    ),
                    child: const Center(
                      child: Text(
                        '100gr',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.subtextColor,
                        ),
                      ),
                    ),
                  ),
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
                    children: List.generate(5, (index){
                      return Padding(padding: EdgeInsets.all(4),child:SvgPicture.asset('assets/icons/star.svg') ,);
                    }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerDetail() {
    Size size = MediaQuery.of(context).size;
    final List<String> imageUrl = [
      "assets/images/apple.png",
      "assets/images/apple2.jpg",
      "assets/images/apple3.jpg",
    ];

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
                  return Image.asset(
                    imageUrl[index],
                    fit: BoxFit.cover,
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
  }
}
