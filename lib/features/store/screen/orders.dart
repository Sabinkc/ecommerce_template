import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../controllers/ordercontrollers.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final orderController = Get.put(OrderControllers());
    final List orderTabs = [
      "All",
      "To Pay",
      "To Ship",
      "To Receive",
      "Returns",
    ];
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
