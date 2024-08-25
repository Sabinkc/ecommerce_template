import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../controllers/wishlistcontroller.dart';
import '../../../model/functions.dart';

class WishlistItemContainer extends StatelessWidget {
  /// Custom Widget to display Wishlist items.
  /// It takes product details.
  const WishlistItemContainer({
    super.key,
    required this.productDetails,
  });
  final Map productDetails;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wishlistController = Get.put(WishlistController());
    final Map image = productDetails["imagewithColor"] ?? {};
    return Container(
      width: size.width,
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
                image: AssetImage(image.values.elementAt(0)[0]),
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
                                color: SQColors.primary.withOpacity(0.2),
                              ),
                              child: Text(
                                "-${productDetails["discountPerc"]}%",
                                style: Theme.of(context).textTheme.labelSmall!.apply(
                                      color: SQColors.primary,
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
                        onTap: () {
                          wishlistController.addToWishList(productDetails["productId"], productDetails);
                        },
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
