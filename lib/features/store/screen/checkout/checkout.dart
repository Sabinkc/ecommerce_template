import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/checkoutcontroller.dart';
import 'widgets/checkoutbottomcontainer.dart';
import 'widgets/checkoutitemcontainer.dart';
import 'widgets/paymentsection.dart';
import 'widgets/recieptsection.dart';
import 'widgets/shippingaddresssection.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class CheckOutScreen extends StatelessWidget {
  /// This Screen shows all the checkout item along with it's price
  /// payment type and address.
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final checkoutController = Get.put(CheckoutController());
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
      bottomSheet: const CheckoutBottomContainer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            children: [
              // List of all items
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: checkoutController.checkoutItem.map(
                  (product) {
                    return CheckoutItemContainer(
                      imagelink: product["image"][0],
                      selectedColor: product["selectedColors"],
                      productPrice: product["discount"] ? product["discountedPrice"] : product["productPrice"],
                      productQty: product["itemQuantity"].toString(),
                      productSpec: product["selectedSpecs"],
                      productTitle: product["productName"],
                    );
                  },
                ).toList(),
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReceiptSection(),
                    Divider(),
                    SizedBox(
                      height: SQSizes.xs,
                    ),
                    PaymentSection(),
                    Divider(),
                    SizedBox(
                      height: SQSizes.xs,
                    ),
                    ShippingAddressSection(),
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
