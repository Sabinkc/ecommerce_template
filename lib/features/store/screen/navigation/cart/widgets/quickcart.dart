import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/popups/loader.dart';
import '../../../../../../common/widgets/elevatedbutton.dart';
import '../controllers/cartcontrollers.dart';
import '../controllers/quickcartcontrollers.dart';
import '../../../wishlist/controllers/wishlistcontroller.dart';
import '../../../../model/functions.dart';
import '../../../product/productdetails.dart';

class QuickCartScreen extends StatelessWidget {
  /// Custom widget to quicky add item to cart.
  /// It take product info to display images, product name, price, colors,
  ///  specs and quantity.
  const QuickCartScreen({super.key, this.productInfo});
  final dynamic productInfo;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final quickcartControllers = Get.put(QuickCartControllers());
    final wishlistController = Get.put(WishlistController());
    final cartController = Get.put(CartControllers());
    final List allSpecs = productInfo["specs"] ?? [];
    final Map testimages = productInfo["imagewithColor"] ?? [];
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
                  quickcartControllers.changeSelectedColorIndex(0);
                  quickcartControllers.changeSelectedSpecIndex(0);
                  quickcartControllers.quantity(1);
                },
                icon: const Icon(
                  Icons.close_outlined,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            SizedBox(
              height: size.height * 0.25,
              child: Obx(
                () {
                  final List selected = testimages.entries.elementAt(quickcartControllers.selectedColorIndex.value).value;
                  return ListView(
                    physics: const ClampingScrollPhysics(),
                    controller: PageController(),
                    scrollDirection: Axis.horizontal,
                    children: selected
                        .map(
                          (image) => Container(
                            width: size.width * 0.4,
                            height: size.height * 0.25,
                            margin: const EdgeInsets.only(right: SQSizes.sml),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  image,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    productInfo["productName"],
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                          fontSizeDelta: 2,
                        ),
                  ),
                ),
                const SizedBox(
                  width: SQSizes.sm,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => ProductDetailsScreen(
                        productDetails: productInfo,
                      ),
                    );
                  },
                  child: Text(
                    "View Details",
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: SQColors.primary,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Rs ",
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              fontWeightDelta: 1,
                              color: SQColors.primary,
                            ),
                      ),
                      TextSpan(
                        text: productInfo["discount"] ? formatNumber(productInfo["discountedPrice"]) : formatNumber(productInfo["productPrice"]),
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                              color: SQColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      TextSpan(
                        text: ".00",
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              fontWeightDelta: 1,
                              color: SQColors.primary,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: SQSizes.sm,
                ),
                Text(
                  productInfo["discount"] ? formatNumber(productInfo["productPrice"]) : "",
                  style: const TextStyle(
                    decorationThickness: 5,
                    fontSize: 15,
                    color: SQColors.darkerGrey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            Text(
              "Colors: ",
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    color: Colors.black,
                    fontWeightDelta: 2,
                  ),
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            Obx(() {
              final List allcolors = testimages.keys.toList();
              return Wrap(
                spacing: 8,
                runSpacing: 6,
                children: allcolors.asMap().entries.map((entry) {
                  int index = entry.key;
                  Color color = entry.value;
                  return InkWell(
                    overlayColor: WidgetStateColor.transparent,
                    onTap: () => quickcartControllers.changeSelectedColorIndex(index),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          width: 2,
                          color: quickcartControllers.selectedColorIndex.value == index ? color : Colors.transparent,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
            allSpecs.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(
                      "Specs: ",
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                            color: Colors.black,
                            fontWeightDelta: 2,
                          ),
                    ),
                  )
                : const SizedBox.shrink(),
            allSpecs.isNotEmpty
                ? Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: allSpecs.asMap().entries.map((entry) {
                      int index = entry.key;
                      String spec = entry.value;
                      return Obx(
                        () => InkWell(
                          overlayColor: WidgetStateColor.transparent,
                          onTap: () {
                            quickcartControllers.changeSelectedSpecIndex(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: quickcartControllers.selectedSpecIndex.value == index ? SQColors.black : SQColors.borderPrimary,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              spec,
                              style: Theme.of(context).textTheme.bodyMedium!.apply(
                                    color: Colors.black,
                                    fontWeightDelta: 1,
                                  ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: SQSizes.md,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Quantity: ",
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                        color: Colors.black,
                        fontWeightDelta: 2,
                      ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => quickcartControllers.removeQuantity(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Iconsax.minus_outline,
                    ),
                  ),
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                Obx(
                  () => Text(
                    "${quickcartControllers.quantity.value}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                InkWell(
                  onTap: () => quickcartControllers.addQuantity(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Iconsax.add_outline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SQSizes.spaceBtwSections,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return IconButton(
                    onPressed: () {
                      wishlistController.addToWishList(productInfo["productId"], productInfo);
                    },
                    icon: Icon(
                      wishlistController.isFav(productInfo["productId"]) ? Iconsax.heart_bold : Iconsax.heart_outline,
                      color: SQColors.primary,
                      size: 30,
                    ),
                  );
                }),
                const SizedBox(
                  width: SQSizes.xs,
                ),
                Flexible(
                  child: SQElevatedButton(
                    func: () {
                      String cartId = UniqueKey().toString();
                      cartController.allCartItems.add({
                        "cartItemId": cartId,
                        "productId": productInfo["productId"],
                        "image": testimages.values.elementAt(quickcartControllers.selectedColorIndex.value),
                        "productName": productInfo["productName"],
                        "productPrice": productInfo["productPrice"],
                        "discountedPrice": productInfo["discountedPrice"],
                        "discount": productInfo["discount"],
                        "selectedColors": testimages.keys.elementAt(quickcartControllers.selectedColorIndex.value),
                        // "selectedColors": productInfo["colors"][quickcartControllers.selectedColorIndex.value],
                        "selectedSpecs": allSpecs.isNotEmpty ? productInfo["specs"][quickcartControllers.selectedSpecIndex.value] : "",
                        "itemQuantity": quickcartControllers.quantity.value,
                      });
                      cartController.selectItems(cartId);
                      quickcartControllers.changeSelectedColorIndex(0);
                      quickcartControllers.changeSelectedSpecIndex(0);
                      quickcartControllers.quantity(1);
                      SQLoader.sucessSnackBar(
                        title: "Added to Cart",
                        message: "An item has been added to the cart.",
                        duration: 1,
                        icon: Iconsax.bag_tick_outline,
                      );
                    },
                    title: "ADD TO CART",
                  ),
                )
              ],
            ),
            const SizedBox(
              height: SQSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
