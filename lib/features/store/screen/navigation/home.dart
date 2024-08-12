import 'package:ecommerce/features/store/controllers/imagecarouselcontroller.dart';
import 'package:ecommerce/features/store/screen/productdetails.dart';
import 'package:ecommerce/features/store/screen/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/wishlistcontroller.dart';
import '../../model/functions.dart';
import '../../model/products.dart';
import '../search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageController = Get.put(ImageCarouselController());

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
      },
      {
        "image": "assets/images/screencat.jpg",
        "categoryName": "Protectors",
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
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              "SysQube",
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    fontWeightDelta: 1,
                  ),
            ),
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: IconButton(
                onPressed: () {
                  Get.to(
                    () => const WishListScreen(),
                  );
                },
                icon: const Icon(Iconsax.heart_outline),
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
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => const SearchScreen(), transition: Transition.rightToLeft);
                    },
                    child: Container(
                      height: size.height * 0.055,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: SQColors.borderSecondary,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.search_normal_1_outline,
                            color: SQColors.darkGrey,
                            size: 24,
                          ),
                          const SizedBox(
                            width: SQSizes.sm,
                          ),
                          Text(
                            "Search...",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(color: SQColors.textSecondary),
                          ),
                          const Spacer(),
                          const VerticalDivider(
                            thickness: 1.5,
                          ),
                          const SizedBox(
                            width: SQSizes.xs,
                          ),
                          const Icon(
                            Icons.sort,
                            color: Colors.black,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SQSizes.xs,
                ),
                SizedBox(
                  height: size.width * 0.5,
                  child: PageView(
                    controller: imageController.pageController,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: imageController.imageLink.map((image) {
                      return Container(
                        width: size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 0),
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
                  controller: imageController.pageController,
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
                SectionHeading(
                  headingTitle: "Shop By Category",
                  func: () {},
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                SectionHeading(
                  headingTitle: "Exclusive Products",
                  func: () {},
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                const SQGridLayout(),
                const SizedBox(
                  height: SQSizes.md,
                ),
                SectionHeading(
                  headingTitle: "New Arrivals",
                  func: () {},
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                const SQGridLayout(),
                const SizedBox(
                  height: SQSizes.md,
                ),
                SectionHeading(
                  headingTitle: "Deals & Discounts",
                  func: () {},
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                const SQGridLayout(),
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

class SQGridLayout extends StatelessWidget {
  const SQGridLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: size.width * 0.6,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductContainer(
            productDetails: product,
          );
        },
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.headingTitle,
    required this.func,
    this.showButton = true,
  });
  final String headingTitle;
  final VoidCallback func;
  final bool? showButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headingTitle,
            style: Theme.of(context).textTheme.bodyLarge!.apply(
                  fontSizeDelta: 1,
                  color: Colors.black,
                ),
          ),
          showButton!
              ? InkWell(
                  onTap: func,
                  child: Text(
                    "See all",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: SQColors.textSecondary,
                        ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.productDetails,
  });

  final dynamic productDetails;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wishlistController = Get.put(WishlistController());

    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () {
        Get.to(
          () => ProductDetailsScreen(productDetails: productDetails),
        );
      },
      child: SizedBox(
        width: size.width * 0.41,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    productDetails["image"][0],
                    width: size.width,
                    //height: size.width * 0.4,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(
                    () => IconButton(
                      onPressed: () {
                        wishlistController.addToWishList(productDetails["productId"]);
                      },
                      icon: Icon(
                        wishlistController.isFav(productDetails["productId"]) ? Iconsax.heart_bold : Iconsax.heart_outline,
                        color: SQColors.primary,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productDetails["productName"],
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall!.apply(
                                    color: Colors.black,
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  productDetails["discount"] ? "Rs ${formatNumber(productDetails["discountedPrice"])}" : "Rs ${formatNumber(productDetails["productPrice"])}",
                                  style: Theme.of(context).textTheme.bodySmall!.apply(
                                        color: Colors.red,
                                        fontSizeFactor: 1,
                                        fontWeightDelta: 1,
                                      ),
                                ),
                                const SizedBox(
                                  width: SQSizes.xs,
                                ),
                                productDetails["discount"]
                                    ? Flexible(
                                        child: Text(
                                          "Rs ${formatNumber(productDetails["productPrice"])}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            decorationThickness: 5,
                                            fontSize: 9,
                                            color: SQColors.darkerGrey,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(
                                        height: SQSizes.xs,
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: SQSizes.md,
                    ),
                    InkWell(
                      onTap: () {
                        onCartClicked(productDetails);
                      },
                      child: const Icon(
                        AntDesign.shopping_cart_outline,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: SQSizes.xs,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
              border: Border.all(
                width: 2,
                color: SQColors.borderSecondary,
              ),
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
