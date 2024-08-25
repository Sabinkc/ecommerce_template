import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../wishlist/controllers/wishlistcontroller.dart';
import '../../../model/functions.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.productDetails,
    required this.func,
  });

  final Map productDetails;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wishlistController = Get.put(WishlistController());
    final Map firstImage = productDetails["imagewithColor"];
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: func,
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
                    firstImage.values.elementAt(0)[0],
                    width: size.width,
                    //height: size.width * 0.4,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(() {
                    return IconButton(
                      onPressed: () {
                        wishlistController.addToWishList(productDetails["productId"], productDetails);
                      },
                      icon: Icon(
                        wishlistController.isFav(productDetails["productId"]) ? Iconsax.heart_bold : Iconsax.heart_outline,
                        color: SQColors.primary,
                        size: 25,
                      ),
                    );
                  }),
                ),
                productDetails["discount"]
                    ? Positioned(
                        top: 10,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: SQColors.primary,
                          ),
                          child: Text(
                            "${productDetails["discountPerc"]}% off",
                            style: Theme.of(context).textTheme.labelMedium!.apply(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            const SizedBox(
                              height: SQSizes.xs,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  productDetails["discount"] ? "Rs ${formatNumber(productDetails["discountedPrice"])}" : "Rs ${formatNumber(productDetails["productPrice"])}",
                                  style: Theme.of(context).textTheme.bodySmall!.apply(
                                        color: SQColors.primary,
                                        fontSizeFactor: 1,
                                        fontWeightDelta: 2,
                                      ),
                                ),
                                const SizedBox(
                                  width: SQSizes.sm,
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
                        CupertinoIcons.cart_badge_plus,
                        size: 24,
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
