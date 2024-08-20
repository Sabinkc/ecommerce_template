import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../widgets/elevatedbutton.dart';
import '../../../controllers/cartcontrollers.dart';
import '../../../model/functions.dart';
import '../../checkout.dart';

class CheckoutContainer extends StatelessWidget {
  const CheckoutContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartControllers = Get.put(CartControllers());
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: SQColors.borderPrimary,
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
          const SizedBox(
            height: SQSizes.sml,
          ),
          const Divider(),
          const SizedBox(
            height: SQSizes.sml,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Rs ",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          TextSpan(
                            text: formatNumber(cartControllers.calculateTotalPrice()),
                            style: Theme.of(context).textTheme.headlineSmall!.apply(
                                  fontSizeDelta: 5,
                                  color: SQColors.primary,
                                ),
                          ),
                          TextSpan(
                            text: ".00",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: SQSizes.lg,
              ),
              Obx(
                () => Flexible(
                  child: SizedBox(
                    height: 45,
                    child: SQElevatedButton(
                      func: () {
                        cartControllers.addToCheckout();

                        Get.to(
                          () => const CheckOutScreen(),
                        );
                      },
                      title: "CHECKOUT (${cartControllers.selectedCartItems.length})",
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: SQSizes.sm,
          ),
        ],
      ),
    );
  }
}
