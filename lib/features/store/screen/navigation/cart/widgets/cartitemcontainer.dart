import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/popups/loader.dart';
import '../controllers/cartcontrollers.dart';
import '../../../../model/functions.dart';

class CartItemContainer extends StatelessWidget {
  const CartItemContainer({
    super.key,
    required this.cartItemDetails,
  });

  final Map<String, dynamic> cartItemDetails;

  @override
  Widget build(BuildContext context) {
    final spec = cartItemDetails["selectedSpecs"];
    final size = MediaQuery.of(context).size;
    final cartControllers = Get.put(CartControllers());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: Stack(
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
              border: Border.all(color: SQColors.borderPrimary),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  cartItemDetails["image"][0],
                  width: 150,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                Flexible(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: SQSizes.xs,
                        ),
                        Text(
                          cartItemDetails["productName"],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: SQSizes.sm,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Rs ${cartItemDetails["discount"] ? formatNumber(cartItemDetails["discountedPrice"]) : formatNumber(cartItemDetails["productPrice"])}",
                              style: Theme.of(context).textTheme.headlineSmall!.apply(
                                    color: SQColors.primary,
                                  ),
                            ),
                            const SizedBox(
                              width: SQSizes.sm,
                            ),
                            Flexible(
                              child: Text(
                                cartItemDetails["discount"] ? formatNumber(cartItemDetails["productPrice"]) : "",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  decorationThickness: 5,
                                  fontSize: 12,
                                  color: SQColors.darkerGrey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: SQSizes.sml,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: cartItemDetails["selectedColors"],
                              ),
                            ),
                            const SizedBox(
                              width: SQSizes.md,
                            ),
                            spec != ""
                                ? Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: SQColors.borderPrimary),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      cartItemDetails["selectedSpecs"],
                                      style: Theme.of(context).textTheme.labelSmall!.apply(
                                            color: Colors.black,
                                            fontWeightDelta: 1,
                                          ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        const SizedBox(
                          height: SQSizes.md,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => cartControllers.decrementItemQuantity(cartItemDetails["cartItemId"]),
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
                                "${cartControllers.getItemQuantity(cartItemDetails["cartItemId"])}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const SizedBox(
                              width: SQSizes.sml,
                            ),
                            InkWell(
                              onTap: () => cartControllers.incrementItemQuantity(cartItemDetails["cartItemId"]),
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
                            const Spacer(),
                            InkWell(
                              overlayColor: WidgetStateColor.transparent,
                              onTap: () {
                                cartControllers.removeItemFromCart(cartItemDetails["cartItemId"]);
                                SQLoader.warningSnackBar(
                                  title: "Removed from Cart",
                                  message: "An Item has been removed from the cart.",
                                  duration: 1,
                                  icon: Iconsax.bag_cross_1_outline,
                                );
                              },
                              child: const Icon(Iconsax.trash_outline),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: SQSizes.sm,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 2,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Obx(
                () => GFCheckbox(
                  size: 25,
                  type: GFCheckboxType.basic,
                  customBgColor: SQColors.primary,
                  onChanged: (value) {
                    cartControllers.selectItems(cartItemDetails["cartItemId"]);
                  },
                  value: cartControllers.isSelected(cartItemDetails["cartItemId"]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
