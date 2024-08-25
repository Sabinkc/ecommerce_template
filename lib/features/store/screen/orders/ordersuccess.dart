import 'package:ecommerce/common/screens/landing.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';

class OrderSuccessScreen extends StatelessWidget {
  /// This screen will be shown when the item is successfully ordered.
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: size.width * 0.4,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        color: SQColors.primary.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: size.width * 0.3,
                      width: size.width * 0.3,
                      decoration: const BoxDecoration(
                        color: SQColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: size.width * 0.15,
                    )
                  ],
                ),
                const SizedBox(
                  height: SQSizes.spaceBtwSections,
                ),
                Text(
                  "Your order has been placed.",
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: SQColors.black,
                        fontWeightDelta: 1,
                      ),
                ),
                const SizedBox(
                  height: SQSizes.sm,
                ),
                const Text(
                  "Your Order #12323 was placed with "
                  "success. You can see the status of the order "
                  "at any time.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: SQSizes.spaceBtwSections,
                ),
                SQElevatedButton(
                  func: () {},
                  title: "See Order Status",
                ),
                const SizedBox(
                  height: SQSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.062,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const LandingScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      overlayColor: SQColors.primary,
                      elevation: 0,
                      backgroundColor: SQColors.borderSecondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Close",
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: Colors.black,
                            letterSpacingDelta: 1,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
