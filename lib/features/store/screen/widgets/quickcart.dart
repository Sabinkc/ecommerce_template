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
    final wishlistController = Get.put(WishlistController());
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
              height: SQSizes.xs,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: productInfo["colors"].length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  List allColors = productInfo["colors"];

                  Color test = allColors.elementAt(index);
                  return Obx(
                    () => InkWell(
                      overlayColor: WidgetStateColor.transparent,
                      onTap: () => colorController.chageSelectedColorIndex(index),
                      child: Container(
                        width: 40,
                        margin: const EdgeInsets.only(right: 2),
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
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: test,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
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
