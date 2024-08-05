import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageController = PageController();
    final List<String> imageLink = [
      "assets/images/HeadPhoneBanner.jpg",
      "assets/images/iPhoneBanner.jpg",
      "assets/images/HeadPhoneBanner.jpg",
    ];
    final List products = [
      {
        "image": "assets/images/laptop.jpg",
        "productName": "Acer Nitro",
        "productPrice": "120,000",
        "productCategory": "Laptop",
      },
      {
        "image": "assets/images/watch.jpg",
        "productName": "G-Shock",
        "productPrice": "10,000",
        "productCategory": "Watch",
      },
      {
        "image": "assets/images/phonecase.jpg",
        "productName": "Iphone Case",
        "productPrice": "1,054",
        "productCategory": "Phone Case",
      },
      {
        "image": "assets/images/headphone.jpg",
        "productName": "HeadPhone",
        "productPrice": "1,054",
        "productCategory": "HeadPhones",
      },
      {
        "image": "assets/images/straps.jpg",
        "productName": "Marvel Straps",
        "productPrice": "750",
        "productCategory": "Straps",
      },
      {
        "image": "assets/images/tempscreen.jpg",
        "productName": "Tempered Screen",
        "productPrice": "500",
        "productCategory": "Screens",
      },
    ];

    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Home",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.heart_outline),
              ),
            ),
          ],
          forceMaterialTransparency: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Iconsax.search_normal_1_outline,
                          color: SQColors.borderSecondary,
                        ),
                        suffixIcon: const Icon(Icons.sort_outlined),
                        hintText: "Search",
                        hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: SQColors.textSecondary),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: SQColors.borderSecondary, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(color: SQColors.black, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(color: SQColors.borderSecondary, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SQSizes.lg,
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                      child: PageView(
                        controller: imageController,
                        scrollDirection: Axis.horizontal,
                        children: imageLink.map((image) {
                          return Container(
                            height: size.height * 0.4,
                            width: size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(image),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: SQSizes.sml,
                    ),
                    SmoothPageIndicator(
                      controller: imageController,
                      count: 3,
                      effect: const WormEffect(
                        activeDotColor: SQColors.primary,
                        dotHeight: 10,
                        dotWidth: 10,
                        strokeWidth: 1,
                      ),
                    ),
                    const SizedBox(
                      height: SQSizes.md,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Special for you",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontWeightDelta: 1,
                              ),
                        ),
                        Text(
                          "See all",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: SQColors.textSecondary,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SQSizes.md,
                    ),
                    GridView.builder(
                      itemCount: products.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        mainAxisExtent: 267,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return HomeProductContainer(
                          imagelink: product["image"],
                          productcategory: product["productCategory"],
                          productname: product["productName"],
                          productprice: product["productPrice"],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeProductContainer extends StatelessWidget {
  const HomeProductContainer({
    super.key,
    required this.imagelink,
    required this.productname,
    required this.productprice,
    required this.productcategory,
  });

  final String imagelink, productname, productprice, productcategory;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: size.width * 0.45,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  //color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagelink),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: size.width * 0.12,
                  height: size.height * 0.06,
                  decoration: const BoxDecoration(
                    color: SQColors.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.heart_outline,
                      color: Colors.white,
                      size: SQSizes.iconMd,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: size.width * 0.45,
            height: size.height * 0.1,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: SQColors.borderSecondary, width: 2),
                left: BorderSide(color: SQColors.borderSecondary, width: 2),
                bottom: BorderSide(color: SQColors.borderSecondary, width: 2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productname,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: SQSizes.xs,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rs $productprice.00",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: SQSizes.xs,
                        ),
                        Text(
                          productcategory,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    Container(
                      width: size.height * 0.05,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: SQColors.borderSecondary,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_shopping_cart_rounded,
                          color: SQColors.textPrimary,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
