import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../model/functions.dart';
import '../controllers/checkoutcontroller.dart';
import 'recieptcontent.dart';

class ReceiptSection extends StatelessWidget {
  /// Receipt Section for Checkout Screen
  const ReceiptSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    return Column(
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
      ],
    );
  }
}
