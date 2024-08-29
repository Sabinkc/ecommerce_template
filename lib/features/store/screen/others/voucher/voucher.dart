import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import 'widgets/voucheronecontainer.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Voucher",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            VoucherOneContainer(
              discountPerc: "15",
              extras: "No min Spend",
              content: "Free Shipping",
              content1: "Selected Products",
              date: "Valid till: 31 Aug, 11:59 PM",
              func: () {},
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            VoucherOneContainer(
              discountPerc: "5",
              extras: "",
              content1: "Only for Phonecases",
              content: "",
              date: "Valid till: 31 Aug, 11:59 PM",
              func: () {},
            ),
          ],
        ),
      ),
    );
  }
}
