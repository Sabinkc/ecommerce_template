import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../utils/constants/sizes.dart';

class EmptyOrderListContainer extends StatelessWidget {
  const EmptyOrderListContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: SQSizes.md,
            ),
            const Icon(
              Iconsax.bag_cross_1_outline,
              size: 100,
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            Text(
              "Your order list is empty",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            Text(
              "Start by exploring our products and great deals!",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
          ],
        ),
      ),
    );
  }
}
