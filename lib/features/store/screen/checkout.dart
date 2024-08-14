import 'package:ecommerce/features/store/controllers/checkoutcontroller.dart';
import 'package:ecommerce/features/store/screen/navigation/home.dart';
import 'package:ecommerce/features/store/screen/ordersuccess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/elevatedbutton.dart';
import '../model/functions.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final checkoutController = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      bottomSheet: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: SQColors.borderPrimary, width: 1),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        child: SQElevatedButton(
          func: () {
            Get.to(() => const OrderSuccessScreen());
          },
          title: "Place Order",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: checkoutController.checkoutItem.map((product) {
                  return CheckoutItemContainer(
                    imagelink: product["image"][0],
                    selectedColor: product["selectedColors"],
                    productPrice: product["discount"] ? product["discountedPrice"] : product["productPrice"],
                    productQty: product["itemQuantity"].toString(),
                    productSpec: product["selectedSpecs"],
                    productTitle: product["productName"],
                  );
                }).toList(),
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const Divider(),
              const SizedBox(
                height: SQSizes.sm,
              ),
              Container(
                width: size.width,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: SQColors.borderSecondary,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Receipt",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    ReceiptContent(
                      title: "Subtotal",
                      price: formatNumber(checkoutController.getSubTotalPrice()),
                    ),
                    ReceiptContent(
                      title: "Shipping Fee",
                      price: "${checkoutController.shippingFee}",
                    ),
                    // ReceiptContent(
                    //   title: "Tax Fee",
                    //   price: formatNumber(checkoutController.taxCalculator()),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Order Total :",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Rs. ",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text: formatNumber(checkoutController.getOrderTotal()),
                                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                                        fontWeightDelta: 1,
                                        color: SQColors.primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    SectionHeading(
                      headingTitle: "Payment Method",
                      func: () {},
                      buttonTitle: "Change",
                    ),
                    const SizedBox(
                      height: SQSizes.sml,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.money_add_outline,
                          size: 30,
                          color: SQColors.dark,
                        ),
                        const SizedBox(
                          width: SQSizes.sm,
                        ),
                        Text(
                          "Cash on Delivery",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SQSizes.sml,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    SectionHeading(
                      headingTitle: "Shipping Address",
                      func: () {},
                      buttonTitle: "Change",
                    ),
                    const SizedBox(
                      height: SQSizes.sml,
                    ),
                    Text(
                      "Suman Shrestha",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: SQSizes.sm,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: SQSizes.sm,
                        ),
                        Text(
                          "9818167498",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_history,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: SQSizes.sm,
                        ),
                        Text(
                          "Budanilkantha, Chunikhel",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.airdrop_outline,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: SQSizes.sm,
                        ),
                        Text(
                          "Kaurna Hospital",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutItemContainer extends StatelessWidget {
  const CheckoutItemContainer({
    super.key,
    required this.imagelink,
    required this.productTitle,
    required this.productPrice,
    required this.productSpec,
    required this.productQty,
    required this.selectedColor,
  });

  final String imagelink, productTitle, productSpec, productQty;
  final int productPrice;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        //color: Colors.amber,
        border: Border.all(
          color: SQColors.borderSecondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagelink),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: SQSizes.sml,
          ),
          Flexible(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: SQSizes.xs,
                  ),
                  Text(
                    "Rs ${formatNumber(productPrice)}",
                    style: Theme.of(context).textTheme.titleSmall!.apply(
                          color: SQColors.primary,
                        ),
                  ),
                  const SizedBox(
                    height: SQSizes.sm,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedColor,
                        ),
                      ),
                      const SizedBox(
                        width: SQSizes.md,
                      ),
                      productSpec.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: SQColors.borderPrimary),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                productSpec,
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
                    height: SQSizes.sm,
                  ),
                  Text(
                    "Qty: $productQty",
                    style: Theme.of(context).textTheme.titleSmall,
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

class ReceiptContent extends StatelessWidget {
  const ReceiptContent({
    super.key,
    required this.title,
    required this.price,
  });

  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "$title :",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Rs: ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: price,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
