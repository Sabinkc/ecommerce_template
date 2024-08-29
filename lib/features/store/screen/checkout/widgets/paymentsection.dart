import 'package:ecommerce/features/store/screen/checkout/widgets/changepayment.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../common/widgets/sectionheading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class PaymentSection extends StatelessWidget {
  /// Payment Section for CheckOut Screen
  const PaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
          headingTitle: "Payment Method",
          func: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const ChangePaymentScreen(),
            );
          },
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
      ],
    );
  }
}
