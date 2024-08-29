import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../others/paymentoptions/widgets/paymentoptioncontainer.dart';

class ChangePaymentScreen extends StatelessWidget {
  const ChangePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Payment",
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
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          children: [
            PaymentOptionContainer(
              title: "Cash on Delivery",
              subtitle: "",
              cardtype: "",
              selected: true,
            ),
            SizedBox(
              height: SQSizes.sm,
            ),
            PaymentOptionContainer(
              title: "Credit Card",
              subtitle: "17845*******44",
              cardtype: "Mastercard",
              selected: false,
            ),
          ],
        ),
      ),
    );
  }
}
