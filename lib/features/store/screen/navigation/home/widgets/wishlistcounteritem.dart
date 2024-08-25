import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../wishlist/controllers/wishlistcontroller.dart';
import '../../../wishlist/wishlist.dart';

class WishlistCounterItem extends StatelessWidget {
  /// Custom widget to get to wishlist screen and also display total number
  /// of favorite items
  const WishlistCounterItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishlistController());
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(
            () => const WishListScreen(),
          ),
          icon: const Icon(
            Iconsax.heart_outline,
            color: SQColors.black,
          ),
        ),
        Obx(
          () => controller.favoriteItems.isNotEmpty
              ? Positioned(
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
                          "${controller.favoriteItems.length}",
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                                color: SQColors.light,
                                fontSizeFactor: 0.9,
                              ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
