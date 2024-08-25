import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../common/widgets/sectionheading.dart';
import '../../../../../utils/constants/sizes.dart';

class ShippingAddressSection extends StatelessWidget {
  /// Shipping Address Section for Checkout Section
  const ShippingAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
