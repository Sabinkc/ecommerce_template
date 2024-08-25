import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../common/widgets/elevatedbutton.dart';
import '../controllers/cartcontrollers.dart';
import '../../../../model/functions.dart';
import '../../../checkout/checkout.dart';

class TotalPriceAndCheckoutContainer extends StatelessWidget {
  /// Custom Bottom Container for Cart Screen.
  /// It should total price and total selected item.
  /// If no item is selected it will be hidden.
  const TotalPriceAndCheckoutContainer({
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
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
    );
  }
}
