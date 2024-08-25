import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../common/widgets/elevatedbutton.dart';
import '../../../../../common/widgets/textfield.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../orders/ordersuccess.dart';
import '../controllers/checkoutcontroller.dart';

class CheckoutBottomContainer extends StatelessWidget {
  /// Through this Widget user can add voucher code and place order.
  /// It is in Checkout Screen
  const CheckoutBottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final checkoutController = Get.put(CheckoutController());
    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: SQColors.borderPrimary, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              // Dialog Box with textfield and button where user can input code.
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Enter Voucher Code",
                        ),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    content: SQTextField(
                      controller: TextEditingController(),
                      hinttext: "Code",
                    ),
                    actions: [
                      SQElevatedButton(
                        func: () {
                          checkoutController.addDiscount(100.0);
                          Get.back();
                        },
                        title: "SUBMIT",
                      ),
                    ],
                  );
                },
              );
            },
            child: Row(
              children: [
                const Icon(
                  Iconsax.ticket_bold,
                  color: SQColors.primary,
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                Expanded(
                  child: Text(
                    "Voucher",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Text(
                  "Click to add",
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: SQColors.textPrimary,
                      ),
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: SQSizes.sml,
          ),
          const Divider(),
          const SizedBox(
            height: SQSizes.sml,
          ),
          SQElevatedButton(
            func: () {
              Get.to(() => const OrderSuccessScreen());
            },
            title: "Place Order",
          ),
        ],
      ),
    );
  }
}
