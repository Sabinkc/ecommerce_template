import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import 'controllers/messagecontroller.dart';
import 'widgets/messagecontainer.dart';

class MessagesScreen extends StatelessWidget {
  /// Users can view all type of notifications in this screen.
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List messagesTab = [
      "All",
      "Activites",
      "Orders",
      "Promos",
    ];
    final messagesController = Get.put(MessagesController());
    return DefaultTabController(
      length: messagesTab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Messages",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: SQColors.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.all(2),
                onTap: (value) => messagesController.changeTabIndex(value),
                tabs: messagesTab.asMap().entries.map((entry) {
                  return Tab(
                    child: Obx(
                      () => Text(
                        entry.value,
                        style: Theme.of(context).textTheme.titleMedium!.apply(
                              color: messagesController.tabIndex.value == entry.key ? SQColors.primary : SQColors.black,
                            ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ListView(
                      children: const [
                        MessagesContainer(
                          title: "Benks ArmorPro Case.. still available in cart.",
                          date: "08/21/2024",
                          imagelink: "",
                          subtitle: "Checkout now & complete your order.",
                          messagetype: "ACTIVITES",
                        ),
                        MessagesContainer(
                          title: "Your Order no #9oAe0 has been shipped.",
                          date: "Today",
                          imagelink: "",
                          subtitle: "Please receive it from the respective address.",
                          messagetype: "ORDER",
                        ),
                        MessagesContainer(
                          title: "Don't forget to check in & get discount.",
                          date: "Yesterday",
                          imagelink: "",
                          subtitle: "Up to 10% off on any purchase greater than 1,000 with free delivery.",
                          messagetype: "PROMO",
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        MessagesContainer(
                          title: "Benks ArmorPro Case.. still available in cart.",
                          date: "08/21/2024",
                          imagelink: "",
                          subtitle: "Checkout now & complete your order.",
                          messagetype: "ACTIVITES",
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        MessagesContainer(
                          title: "Your Order no #9oAe0 has been shipped.",
                          date: "Today",
                          imagelink: "",
                          subtitle: "Please receive it from the respective address.",
                          messagetype: "ORDER",
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        MessagesContainer(
                          title: "Don't forget to check in & get discount.",
                          date: "Yesterday",
                          imagelink: "",
                          subtitle: "Up to 10% off on any purchase greater than 1,000 with free delivery.",
                          messagetype: "PROMO",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
