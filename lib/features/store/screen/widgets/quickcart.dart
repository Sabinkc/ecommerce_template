import 'package:ecommerce/features/store/controllers/colorcontroller.dart';
import 'package:ecommerce/features/store/controllers/wishlistcontroller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class QuickCartScreen extends StatelessWidget {
  const QuickCartScreen({super.key, this.productInfo});
  final dynamic productInfo;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorController = Get.put(ColorController());
    final specController = Get.put(SpecController());
    final wishlistController = Get.put(WishlistController());
    final List allColors = productInfo["colors"];
    final List allSpecs = productInfo["specs"] ?? [];
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
                  colorController.chageSelectedColorIndex(0);
                  specController.chageSelectedSpecIndex(0);
                },
                icon: const Icon(
                  Iconsax.close_circle_outline,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            SizedBox(
              height: size.height * 0.25,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                controller: PageController(),
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          productInfo["image"],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: SQSizes.sml,
                  ),
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          productInfo["image"],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: SQSizes.sml,
                  ),
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          productInfo["image"],
                        ),
                      ),
                    ),
                  ),
                ],
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
                  onTap: () {},
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
                        text: productInfo["discount"] ? productInfo["discountedPrice"] : productInfo["productPrice"],
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
                  productInfo["discount"] ? productInfo["productPrice"] : "",
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
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: allColors.asMap().entries.map((entry) {
                int index = entry.key;
                Color color = entry.value;
                return Obx(
                  () => InkWell(
                    overlayColor: WidgetStateColor.transparent,
                    onTap: () => colorController.chageSelectedColorIndex(index),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          width: 2,
                          color: colorController.selectedColorIndex.value == index ? SQColors.primary : Colors.transparent,
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
                  ),
                );
              }).toList(),
            ),
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
                            specController.selectedSpecIndex(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                            decoration: BoxDecoration(
                              color: SQColors.softGrey,
                              border: Border.all(
                                width: 2,
                                color: specController.selectedSpecIndex.value == index ? SQColors.black : SQColors.borderPrimary,
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
              height: SQSizes.spaceBtwSections,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => IconButton(
                    onPressed: () {
                      wishlistController.addToWishList(productInfo["productId"]);
                    },
                    icon: Icon(
                      wishlistController.isFav(productInfo["productId"]) ? Iconsax.heart_bold : Iconsax.heart_outline,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: SQSizes.xs,
                ),
                Flexible(
                  child: SQElevatedButton(
                    func: () {},
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
