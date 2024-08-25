import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/controllers/landingcontroller.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../cart/controllers/cartcontrollers.dart';

class CartCounterItem extends StatelessWidget {
  const CartCounterItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartControllers());
    final landingcontroller = Get.put(LandingScreenController());
    return Stack(
      children: [
        IconButton(
          onPressed: () => landingcontroller.index(2),
          icon: const Icon(
            CupertinoIcons.cart,
            color: SQColors.black,
          ),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: SQColors.primary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  "${controller.allCartItems.length}",
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: SQColors.light,
                        fontSizeFactor: 0.9,
                      ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
