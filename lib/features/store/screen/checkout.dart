import 'package:ecommerce/features/store/screen/navigation/home.dart';
import 'package:flutter/material.dart';
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
          func: () {},
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
              Container(
                width: size.width,
                padding: const EdgeInsets.all(10),
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
                        image: const DecorationImage(
                          image: AssetImage("assets/images/laptop.jpg"),
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
                              "Lenovo Ideapad 1 15lGL7 11th Gen Intel Celeron N4020 8GB DDR4 RAM 256GB SSD 15.6 HD Display",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: SQSizes.xs,
                            ),
                            Text(
                              "Rs ${formatNumber(110500)}",
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: SQSizes.md,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: SQColors.borderPrimary),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "16GB / 512GB",
                                    style: Theme.of(context).textTheme.labelSmall!.apply(
                                          color: Colors.black,
                                          fontWeightDelta: 1,
                                        ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: SQSizes.sm,
                            ),
                            Text(
                              "Qty: 1",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
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
                    const ReceiptContent(
                      title: "Subtotal",
                      price: "110,500",
                    ),
                    const ReceiptContent(
                      title: "Shipping Fee",
                      price: "100",
                    ),
                    const ReceiptContent(
                      title: "Tax Fee",
                      price: "105",
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
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Rs. ",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text: "110,705",
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
