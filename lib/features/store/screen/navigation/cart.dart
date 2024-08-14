import 'package:ecommerce/features/store/screen/checkout.dart';
import 'package:ecommerce/features/store/screen/navigation/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/popups/loader.dart';
import '../../../../widgets/elevatedbutton.dart';
import '../../controllers/cartcontrollers.dart';
import '../../controllers/wishlistcontroller.dart';
import '../../model/functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartControllers = Get.put(CartControllers());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          "My Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
        actions: [
          Text(
            "Select all",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: Obx(
                () => GFCheckbox(
                  type: GFCheckboxType.custom,
                  customBgColor: SQColors.primary,
                  size: 20,
                  onChanged: (value) {
                    cartControllers.selectAllItems();
                  },
                  value: cartControllers.selectAll.value,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: SQSizes.xs,
          ),
        ],
      ),
      bottomSheet: Obx(
        () => cartControllers.selectedCartItems.isNotEmpty
            ? Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: SQColors.borderPrimary,
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Iconsax.ticket_bold,
                          color: SQColors.primary,
                        ),
                        const SizedBox(
                          width: SQSizes.sml,
                        ),
                        Expanded(
                          child: Text(
                            "Voucher",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text(
                          "Click to add",
                          style: Theme.of(context).textTheme.bodySmall!.apply(
                                color: SQColors.textPrimary,
                              ),
                        ),
                        const SizedBox(
                          width: SQSizes.sml,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SQSizes.sml,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: SQSizes.sml,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Obx(
                              () => RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Rs ",
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                    TextSpan(
                                      text: formatNumber(cartControllers.calculateTotalPrice()),
                                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                                            fontSizeDelta: 5,
                                            color: SQColors.primary,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ".00",
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: SQSizes.lg,
                        ),
                        Obx(
                          () => Flexible(
                            child: SizedBox(
                              height: 45,
                              child: SQElevatedButton(
                                func: () {
                                  cartControllers.addToCheckout();

                                  Get.to(
                                    () => const CheckOutScreen(),
                                  );
                                },
                                title: "CHECKOUT (${cartControllers.selectedCartItems.length})",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SQSizes.sm,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DiscountVoucherContainter(),
              const SizedBox(
                height: SQSizes.sml,
              ),
              Obx(
                () => cartControllers.allCartItems.isNotEmpty
                    ? ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: cartControllers.allCartItems
                            .map(
                              (items) => CartItemContainer(cartItemDetails: items),
                            )
                            .toList(),
                      )
                    : Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              CupertinoIcons.shopping_cart,
                              size: 80,
                            ),
                            const SizedBox(
                              height: SQSizes.sml,
                            ),
                            Text(
                              "Your Cart is Empty.",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              height: SQSizes.xs,
                            ),
                            Text(
                              "Please add a few items.",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
              ),
              const SizedBox(
                height: SQSizes.sml,
              ),
              const Divider(),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text("You might like to fill it with"),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: SQGridLayout()),
              Obx(
                () => cartControllers.selectedCartItems.isNotEmpty
                    ? const SizedBox(
                        height: 180,
                      )
                    : const SizedBox(
                        height: SQSizes.md,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiscountVoucherContainter extends StatelessWidget {
  const DiscountVoucherContainter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Color(0xFFD7ECFF),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Iconsax.ticket_star_bold,
            color: SQColors.primary,
            size: 20,
          ),
          Flexible(
            child: Text(
              "You have a discount voucher for the products",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
            size: 15,
          ),
        ],
      ),
    );
  }
}

class CartItemContainer extends StatelessWidget {
  const CartItemContainer({
    super.key,
    required this.cartItemDetails,
  });

  final Map<String, dynamic> cartItemDetails;

  @override
  Widget build(BuildContext context) {
    final spec = cartItemDetails["selectedSpecs"];
    final wishlistController = Get.put(WishlistController());
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
                            Obx(
                              () => InkWell(
                                overlayColor: WidgetStateColor.transparent,
                                onTap: () {
                                  wishlistController.addToWishList(cartItemDetails["productId"], cartItemDetails);
                                },
                                child: Icon(
                                  wishlistController.isFav(cartItemDetails["productId"]) ? Iconsax.heart_bold : Iconsax.heart_outline,
                                  color: SQColors.primary,
                                ),
                              ),
                            ),
                            const Spacer(),
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
                  type: GFCheckboxType.custom,
                  customBgColor: SQColors.primary,
                  onChanged: (value) {
                    cartControllers.selectItems(cartItemDetails["cartItemId"]);
                  },
                  value: cartControllers.isSelected(cartItemDetails["cartItemId"]),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            left: 0,
            child: IconButton(
              onPressed: () {
                cartControllers.removeItemFromCart(cartItemDetails["cartItemId"]);
                SQLoader.warningSnackBar(
                  title: "Removed from Cart",
                  message: "An Item has been removed from the cart.",
                  duration: 1,
                );
              },
              icon: const Icon(Iconsax.trash_outline),
            ),
          )
        ],
      ),
    );
  }
}
