import 'package:ecommerce/features/store/screen/checkout.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/constants/colors.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        centerTitle: true,
        title: Text(
          "Order Details",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: SQColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Order No: #98731223",
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            Text(
              "Placed on: 18 Aug, 2024 - 4:00 PM",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            Text(
              "Delivery Address",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: SQSizes.xs,
            ),
            Row(
              children: [
                const Icon(
                  Iconsax.map_1_outline,
                  size: 20,
                ),
                const SizedBox(
                  width: SQSizes.sm,
                ),
                Text(
                  "Budanilkantha, Chunikhel",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: SQColors.borderPrimary,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1x Iphone case",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "Rs: 1,000",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SQSizes.xs,
                  ),
                  const Divider(
                    color: SQColors.borderPrimary,
                  ),
                  const SizedBox(
                    height: SQSizes.xs,
                  ),
                  const ReceiptContent(title: "Subtotal", price: "1,000"),
                  const ReceiptContent(title: "Shipping Fee", price: "100"),
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
                                text: "1,100",
                                style: Theme.of(context).textTheme.headlineSmall!.apply(
                                      fontWeightDelta: 1,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              decoration: BoxDecoration(
                border: Border.all(
                  color: SQColors.borderPrimary,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Paid with",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Cash on Delivery",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
