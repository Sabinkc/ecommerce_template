import 'package:ecommerce/features/store/screen/others/paymentoptions/addpaymentoption.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'widgets/paymentoptioncontainer.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Options",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      floatingActionButton: SizedBox(
        height: size.height * 0.08,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                enableDrag: false,
                context: context,
                builder: (context) => const AddPaymentOptionScreen(),
              );
            },
            backgroundColor: SQColors.primary,
            child: const Icon(
              Iconsax.add_outline,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: const Padding(
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
