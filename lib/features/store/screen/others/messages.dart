import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';

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

class MessagesContainer extends StatelessWidget {
  const MessagesContainer({
    super.key,
    required this.title,
    required this.date,
    required this.imagelink,
    required this.subtitle,
    required this.messagetype,
  });

  final String title, date, imagelink, subtitle, messagetype;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            Flexible(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  height: 200,
                  margin: const EdgeInsets.only(left: 10),
                  color: Colors.red,
                  child: const Icon(
                    Iconsax.trash_outline,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: SQColors.softGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: messagetype == "ORDER"
                        ? Colors.blue
                        : messagetype == "PROMO"
                            ? Colors.redAccent
                            : Colors.amber,
                    radius: 16,
                    child: messagetype == "ORDER"
                        ? const Icon(
                            Iconsax.box_bold,
                            size: 20,
                            color: Colors.white,
                          )
                        : messagetype == "PROMO"
                            ? const Icon(
                                Iconsax.flash_bold,
                                size: 20,
                                color: Colors.white,
                              )
                            : const Icon(
                                Iconsax.activity_bold,
                                size: 20,
                                color: Colors.white,
                              ),
                  ),
                  const SizedBox(
                    width: SQSizes.sm,
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            date,
                            style: Theme.of(context).textTheme.labelSmall!.apply(
                                  color: SQColors.darkGrey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              Container(
                width: size.width,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/Banner.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesController extends GetxController {
  static MessagesController get instance => Get.find();

  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
