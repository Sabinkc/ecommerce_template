import 'package:ecommerce/features/store/screen/checkout/controllers/checkoutcontroller.dart';
import 'package:ecommerce/features/store/screen/orders/ordersuccess.dart';
import 'package:ecommerce/common/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/elevatedbutton.dart';
import '../../../../common/widgets/sectionheading.dart';
import '../../model/functions.dart';
import 'widgets/checkoutitemcontainer.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Enter Voucher Code",
                          ),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      content: SQTextField(
                        controller: TextEditingController(),
                        hinttext: "Code",
                      ),
                      actions: [
                        SQElevatedButton(
                          func: () {
                            checkoutController.addDiscount(100.0);
                            Get.back();
                          },
                          title: "SUBMIT",
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
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
            ),
            const SizedBox(
              height: SQSizes.sml,
            ),
            const Divider(),
            const SizedBox(
              height: SQSizes.sml,
            ),
            SQElevatedButton(
              func: () {
                Get.to(() => const OrderSuccessScreen());
              },
              title: "Place Order",
            ),
          ],
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
                    Obx(
                      () => checkoutController.voucherDiscount.value > 0
                          ? ReceiptContent(
                              title: "Discount",
                              price: formatNumber(checkoutController.voucherDiscount.value),
                            )
                          : const SizedBox.shrink(),
                    ),
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
                          Obx(
                            () => RichText(
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
                height: 120,
              ),
            ],
          ),
        ),
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
            style: Theme.of(context).textTheme.titleMedium!.apply(
                  color: title == "Discount" ? Colors.red : Colors.black,
                ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Rs: ",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: title == "Discount" ? Colors.red : Colors.black,
                      ),
                ),
                TextSpan(
                  text: price,
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                        color: title == "Discount" ? Colors.red : Colors.black,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
