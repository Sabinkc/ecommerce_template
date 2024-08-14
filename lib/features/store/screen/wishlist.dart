import 'package:ecommerce/features/store/controllers/wishlistcontroller.dart';
import 'package:ecommerce/features/store/model/functions.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'navigation/home.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController = Get.put(WishlistController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Obx(
                () => wishlistController.favoriteItems.isEmpty
                    ? Column(
                        children: [
                          const Icon(
                            Iconsax.heart_bold,
                            color: SQColors.primary,
                            size: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "You currently have nothing saved in your wishlist.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: wishlistController.favoriteItems.map((product) {
                            return WishlistItemContainer(
                              productDetails: product,
                            );
                          }).toList(),
                        ),
                      ),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text("You might like to fill it with"),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              const SQGridLayout(),
            ],
          ),
        ),
      ),
    );
  }
}

class WishlistItemContainer extends StatelessWidget {
  const WishlistItemContainer({
    super.key,
    required this.productDetails,
  });
  final dynamic productDetails;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wishlistController = Get.put(WishlistController());

    return Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: SQColors.borderPrimary),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(productDetails["image"][0]),
              ),
            ),
          ),
          const SizedBox(
            width: SQSizes.sm,
          ),
          Flexible(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      productDetails["productName"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: SQSizes.sm,
                  ),
                  Text(
                    "Rs.${productDetails["discount"] ? formatNumber(productDetails["discountedPrice"]) : formatNumber(productDetails["productPrice"])}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  productDetails["discount"]
                      ? Row(
                          children: [
                            Text(
                              "Rs ${formatNumber(productDetails["productPrice"])}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                decorationThickness: 4,
                                fontSize: 16,
                                color: SQColors.darkerGrey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(
                              width: SQSizes.sm,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(108, 255, 182, 72),
                              ),
                              child: Text(
                                "-${productDetails["discountPerc"]}%",
                                style: Theme.of(context).textTheme.labelSmall!.apply(
                                      color: Colors.red,
                                    ),
                              ),
                            )
                          ],
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: SQSizes.sm,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => wishlistController.addToWishList(productDetails["productId"], productDetails),
                        child: const Icon(
                          Iconsax.trash_outline,
                          size: 26,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 40,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: SQColors.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: IconButton(
                          onPressed: () {
                            onCartClicked(productDetails);
                          },
                          icon: const Icon(
                            CupertinoIcons.cart_badge_plus,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: SQSizes.sml,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
