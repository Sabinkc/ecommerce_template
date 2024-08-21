import 'package:ecommerce/features/store/screen/orderdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../controllers/ordercontrollers.dart';
import '../model/alltabs.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderControllers());

    return DefaultTabController(
      length: orderTabs.length,
      initialIndex: orderController.tabIndex.value,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Orders",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          forceMaterialTransparency: true,
        ),
        body: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: SQColors.primary,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorSize: TabBarIndicatorSize.label,
              onTap: (value) => orderController.changeTabIndex(value),
              tabs: orderTabs.asMap().entries.map((entry) {
                return Tab(
                  child: Obx(
                    () => Text(
                      entry.value,
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                            color: orderController.tabIndex.value == entry.key ? SQColors.primary : SQColors.black,
                          ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            const Flexible(
              fit: FlexFit.loose,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      OrderedItemContainer(
                        placedDate: "18 Aug, 2024",
                        orderNo: "#98731223",
                        imageLink: "assets/images/phonecase.jpg",
                        productTitle: "Benks ArmorPro Case for iPhone 15 Pro Max 600D Aramid Fiber Cover",
                        quantityNo: "1",
                        orderStatus: "To Pay",
                        deliveredBy: "20 Aug, 2024",
                      ),
                      OrderedItemContainer(
                        placedDate: "18 Aug, 2024",
                        orderNo: "#1549879654",
                        imageLink: "assets/images/laptop.jpg",
                        productTitle: "Lenovo Ideapad 1 15lGL7 11th Gen Intel Celeron",
                        quantityNo: "1",
                        orderStatus: "To Review",
                        deliveredBy: "20 Aug, 2024",
                      ),
                    ],
                  ),
                  EmptyOrderListContainer(),
                  EmptyOrderListContainer(),
                  EmptyOrderListContainer(),
                  EmptyOrderListContainer(),
                  EmptyOrderListContainer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrderedItemContainer extends StatelessWidget {
  const OrderedItemContainer({
    super.key,
    required this.placedDate,
    required this.orderNo,
    required this.imageLink,
    required this.productTitle,
    required this.quantityNo,
    required this.orderStatus,
    required this.deliveredBy,
  });

  final String placedDate, orderNo, imageLink, productTitle, quantityNo, orderStatus, deliveredBy;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () => Get.to(
        () => OrderDetailsScreen(
          orderStatus: orderStatus,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        padding: const EdgeInsets.all(
          10,
        ),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: SQColors.borderPrimary,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Placed on: ",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: placedDate,
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              fontWeightDelta: 1,
                            ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Order no: ",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: orderNo,
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              fontWeightDelta: 1,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SQSizes.sml,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    image: DecorationImage(
                      image: AssetImage(imageLink),
                    ),
                  ),
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                Flexible(
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            productTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(
                          height: SQSizes.sm,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Quantity: ",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              TextSpan(
                                text: quantityNo,
                                style: Theme.of(context).textTheme.labelLarge!.apply(
                                      fontWeightDelta: 1,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: SQSizes.sm,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: SQColors.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            orderStatus,
                            style: Theme.of(context).textTheme.labelLarge!.apply(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: SQSizes.sm,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Delivery By: ",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              TextSpan(
                                text: deliveredBy,
                                style: Theme.of(context).textTheme.labelLarge!.apply(
                                      fontWeightDelta: 1,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyOrderListContainer extends StatelessWidget {
  const EmptyOrderListContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: SQSizes.md,
            ),
            const Icon(
              Iconsax.bag_cross_1_outline,
              size: 100,
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            Text(
              "Your order list is empty",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            Text(
              "Start by exploring our products and great deals!",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
          ],
        ),
      ),
    );
  }
}
