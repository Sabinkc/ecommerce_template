import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'controllers/ordercontrollers.dart';
import '../../model/alltabs.dart';
import 'widgets/emptyorderlistcontainer.dart';
import 'widgets/ordereditemcontainer.dart';

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
                        imageLink: "assets/images/iphonecases/iphone15_1.jpg",
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
