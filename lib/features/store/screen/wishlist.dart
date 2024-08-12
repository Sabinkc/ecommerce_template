import 'package:ecommerce/widgets/elevatedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'navigation/home.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      bottomSheet: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: SQColors.borderPrimary, width: 2),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        child: SQElevatedButton(
          func: () {},
          title: "ADD ALL TO CART",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const Icon(
                Iconsax.heart_bold,
                color: SQColors.primary,
                size: 100,
              ),
              Text(
                "You currently have nothing saved in your wishlist.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Container(
                width: size.width,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: SQColors.borderPrimary),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/phonecase.jpg"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: SQSizes.sm,
                    ),
                    Flexible(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                "Benks ArmorPro Case for iPhone 15 Pro Max 600D Aramid Fiber Cover",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const SizedBox(
                              height: SQSizes.sm,
                            ),
                            Text(
                              "Rs. 1,054",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              height: SQSizes.xs,
                            ),
                            const Text(
                              "Rs 1200",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                decorationThickness: 4,
                                fontSize: 16,
                                color: SQColors.darkerGrey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(
                              height: SQSizes.sm,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Iconsax.trash_outline,
                                  size: 26,
                                ),
                                Container(
                                  width: 50,
                                  height: 40,
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    color: SQColors.primary,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      CupertinoIcons.cart_badge_plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: SQSizes.sml,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text("You might like to fill it with"),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              const SQGridLayout(),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
