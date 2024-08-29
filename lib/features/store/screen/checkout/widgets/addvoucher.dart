import 'package:ecommerce/common/widgets/textfield.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../others/voucher/widgets/voucheronecontainer.dart';
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
            VoucherOneContainer(
              discountPerc: "15",
              extras: "No min Spend",
              content: "Free Shipping",
              content1: "Selected Products",
              date: "Valid till: 31 Aug, 11:59 PM",
              func: () {
                checkoutController.addDiscount(100.0);
                Get.back();
              },
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
              func: () {
                checkoutController.addDiscount(100.0);
                Get.back();
              },
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
