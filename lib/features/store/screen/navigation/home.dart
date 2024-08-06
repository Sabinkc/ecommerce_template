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
    final List categories = [
      {
        "image": "assets/images/headphonecat.jpg",
        "categoryName": "Headphones",
      },
      {
        "image": "assets/images/watchcat.jpg",
        "categoryName": "Watches",
      },
      {
        "image": "assets/images/casecat.jpg",
        "categoryName": "Cases",
      },
      {
        "image": "assets/images/speakercat.jpg",
        "categoryName": "Speakers",
      },
      {
        "image": "assets/images/airpodcat.jpg",
        "categoryName": "Airpods",
      }
    ];
    final List products = [
      {
        "image": "assets/images/laptop.jpg",
        "productName": "Acer Nitro",
        "productPrice": "130,000",
        "discountedPrice": "110,00",
        "discount": true,
      },
      {
        "image": "assets/images/watch.jpg",
        "productName": "G-Shock",
        "productPrice": "10,000",
        "discountedPrice": "0",
        "discount": false,
      },
      {
        "image": "assets/images/phonecase.jpg",
        "productName": "Iphone Case",
        "productPrice": "1,054",
        "discountedPrice": "0",
        "discount": false,
      },
      {
        "image": "assets/images/headphone.jpg",
        "productName": "HeadPhone",
        "productPrice": "1,100",
        "discountedPrice": "1,000",
        "discount": true,
      },
    ];

    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateAnyDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "SysQube",
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    fontWeightDelta: 2,
                  ),
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
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ],
          forceMaterialTransparency: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: size.height * 0.067,
                          // width: size.width * 0.7,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Iconsax.search_normal_1_outline,
                                color: SQColors.borderSecondary,
                              ),
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
                        ),
                      ),
                      const SizedBox(
                        width: SQSizes.xs,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.sort,
                          color: Colors.black,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: SQSizes.xs,
                ),
                SizedBox(
                  height: size.width * 0.5,
                  child: PageView(
                    controller: imageController,
                    scrollDirection: Axis.horizontal,
                    children: imageLink.map((image) {
                      return Container(
                        width: size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shop By Category",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontWeightDelta: 2,
                              color: Colors.black,
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
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: size.width * 0.22,
                    child: ListView.builder(
                      itemCount: categories.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryContainer(imagelink: category["image"], categroyName: category["categoryName"]);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Exclusive Products",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontWeightDelta: 2,
                              color: Colors.black,
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
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 235,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductContainer(
                        imagelink: product["image"],
                        productTitle: product["productName"],
                        productPrice: product["productPrice"],
                        discountedPrice: product["discountedPrice"],
                        gotDiscount: product["discount"],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Arrivals",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontWeightDelta: 2,
                              color: Colors.black,
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
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 235,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductContainer(
                        imagelink: product["image"],
                        productTitle: product["productName"],
                        productPrice: product["productPrice"],
                        discountedPrice: product["discountedPrice"],
                        gotDiscount: product["discount"],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Deals & Discounts",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontWeightDelta: 2,
                              color: Colors.black,
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
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 235,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductContainer(
                        imagelink: product["image"],
                        productTitle: product["productName"],
                        productPrice: product["productPrice"],
                        discountedPrice: product["discountedPrice"],
                        gotDiscount: product["discount"],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.imagelink,
    required this.productTitle,
    required this.productPrice,
    required this.discountedPrice,
    required this.gotDiscount,
  });

  final String imagelink, productTitle, productPrice, discountedPrice;
  final bool gotDiscount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  imagelink,
                  width: size.width,
                  height: 160,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.heart_outline,
                    size: 25,
                    color: SQColors.primary,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: SQSizes.xs,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              productTitle,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                    color: Colors.black,
                    fontWeightDelta: 1,
                  ),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gotDiscount
                        ? SizedBox(
                            width: size.width * 0.2,
                            child: Text(
                              "Rs $productPrice",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                decorationThickness: 5,
                                fontSize: 12,
                                color: SQColors.darkerGrey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          )
                        : Container(),
                    gotDiscount
                        ? Text(
                            "Rs $discountedPrice",
                            style: Theme.of(context).textTheme.bodySmall!.apply(
                                  color: Colors.red,
                                  fontWeightDelta: 1,
                                ),
                          )
                        : Text(
                            "Rs $productPrice",
                            style: Theme.of(context).textTheme.bodySmall!.apply(
                                  color: Colors.red,
                                  fontWeightDelta: 1,
                                ),
                          ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_shopping_cart_outlined,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.categroyName,
    required this.imagelink,
  });

  final String categroyName, imagelink;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      child: Column(
        children: [
          Container(
            width: size.width * 0.15,
            height: size.width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagelink),
              ),
            ),
          ),
          const SizedBox(
            height: SQSizes.sm,
          ),
          Text(
            categroyName,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  fontWeightDelta: 2,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
