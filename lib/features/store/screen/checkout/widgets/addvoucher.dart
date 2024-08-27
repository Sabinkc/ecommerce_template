import 'package:ecommerce/common/widgets/textfield.dart';
import 'package:ecommerce/features/store/screen/others/voucher.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../controllers/checkoutcontroller.dart';

class AddVoucherScreen extends StatelessWidget {
  const AddVoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vouchers",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close_outlined,
              size: 30,
            ),
          ),
        ],
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            SQTextField(
              controller: TextEditingController(),
              hinttext: "Enter Promo Code.",
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            const Divider(),
            const SizedBox(
              height: SQSizes.sm,
            ),
            VoucherContainer(
              discountperc: "15",
              subtitles: const [
                "Free Shipping",
                "Only Selected Products",
                "Vaid Till 31, Aug.",
              ],
              notes: "This voucher is a token of our gratitude for joining us. "
                  "Your support is helping us shape the future of e-commerce.",
              func: () {
                checkoutController.addDiscount(100.0);
                Get.back();
              },
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            VoucherContainer(
              discountperc: "5",
              subtitles: const [
                "Only For Phonecases",
                "Vaid Till 31, Aug.",
              ],
              func: () {
                checkoutController.addDiscount(100.0);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
